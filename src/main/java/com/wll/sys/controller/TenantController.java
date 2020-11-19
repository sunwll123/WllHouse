package com.wll.sys.controller;


import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.wll.sys.common.DataGridView;
import com.wll.sys.common.ResultObj;
import com.wll.sys.common.TreeNode;
import com.wll.sys.common.WebUtils;
import com.wll.sys.entity.Tenant;
import com.wll.sys.entity.User;
import com.wll.sys.service.ITenantService;
import com.wll.sys.vo.TenantVo;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.*;

/**
 * <p>
 * InnoDB free: 9216 kB 前端控制器
 * </p>
 *
 * @author wll
 * @since 2020-11-11
 */
@RestController
@RequestMapping("/tenant")
public class TenantController {

    @Autowired
    private ITenantService tenantService;

    /**
     * 查询所有部门数据
     *
     * @param
     * @return
     */
    @RequestMapping("loadAll")
    public DataGridView loadAllTenant(TenantVo tenantVo) {
        return tenantService.loadAllTenant(tenantVo);
    }

    /**
     * 添加部门
     *
     * @param tenantVo
     * @return
     */
    @RequestMapping("add")
    public ResultObj add(TenantVo tenantVo) {
        try {
            tenantVo.setCreatetime(new Date());
            tenantService.save(tenantVo);
            return ResultObj.ADD_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.ADD_ERROR;
        }
    }

    /**
     * 加载排序码
     *
     * @return
     */
    @RequestMapping("loadTenantMaxOrderNum")
    public Map<String, Object> loadTenantMaxOrderNum() {
        Map<String, Object> map = new HashMap<String, Object>();
        QueryWrapper<Tenant> queryWrapper = new QueryWrapper<>();
        queryWrapper.orderByDesc("ordernum");
        IPage<Tenant> page = new Page<>(1, 1);
        List<Tenant> list = tenantService.page(page, queryWrapper).getRecords();
        if (list.size() > 0) {
            map.put("value", list.get(0).getOrdernum() + 1);
        } else {
            map.put("value", 1);
        }
        return map;
    }

    /**
     * 更新租户
     *
     * @param deptVo
     * @return
     */
    @RequestMapping("update")
    public ResultObj update(TenantVo deptVo) {
        try {
            tenantService.updateById(deptVo);
            return ResultObj.UPDATE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.UPDATE_ERROR;
        }
    }

    /**
     * 删除租户
     *
     * @param
     * @return
     */
    @RequestMapping("delete")
    public ResultObj delete(TenantVo tenantVo) {
        try {
            tenantService.removeById(tenantVo.getId());
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
    }

    /**
     * 加载所有租户的下拉列表
     * @return
     */
    @RequestMapping("loadAllTenantForSelect")
    public DataGridView loadAllProviderLogisticsForSelect(){
        LambdaQueryWrapper<Tenant> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(Tenant::getAvailable, 1);
        User user = (User) WebUtils.getSession().getAttribute("user");
        if (user.getTenantId() != 0){
            queryWrapper.eq(Tenant::getId,user.getTenantId());
        }
        List<Tenant> list = tenantService.list(queryWrapper);
        return new DataGridView(list);
    }

}

