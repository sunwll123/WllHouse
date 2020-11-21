package com.wll.bus.controller;

import com.wll.bus.service.ILogisticsBaseService;
import com.wll.bus.vo.LogisticsBaseVo;
import com.wll.sys.common.DataGridView;
import com.wll.sys.common.ResultObj;
import com.wll.sys.common.WebUtils;
import com.wll.sys.entity.User;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;


/**
 * @author wll
 * @Author: wll
 * @Description: 物流基础管理控制层
 * @since 2020-11-11
 */
@RestController
@RequestMapping("/logisticsBase")
@Log4j2
public class LogisticsBaseController {

    @Autowired
    private ILogisticsBaseService logisticsBaseService;

    /**
     * 查询所有的客户
     *
     * @param logisticsBaseVo
     * @return
     */
    @RequestMapping("loadAllList")
    public DataGridView loadAll(LogisticsBaseVo logisticsBaseVo) {
        return logisticsBaseService.loadAll(logisticsBaseVo);
    }

    /**
     * 添加一个物流
     *
     * @param logisticsBaseVo
     * @return
     */
    @RequestMapping("add")
    public ResultObj addCustomer(LogisticsBaseVo logisticsBaseVo) {
        try {
            User user = (User) WebUtils.getSession().getAttribute("user");
            logisticsBaseVo.setTenantId(user.getTenantId());
            logisticsBaseService.save(logisticsBaseVo);
            return ResultObj.ADD_SUCCESS;
        } catch (Exception e) {
            log.error("新增{}物流信息失败", logisticsBaseVo.getLogisticsName(), e);
            return ResultObj.ADD_ERROR;
        }
    }

    /**
     * 修改一个物流信息
     *
     * @param logisticsBaseVo
     * @return
     */
    @RequestMapping("update")
    public ResultObj updateCustomer(LogisticsBaseVo logisticsBaseVo) {
        try {
            logisticsBaseService.updateById(logisticsBaseVo);
            return ResultObj.UPDATE_SUCCESS;
        } catch (Exception e) {
            log.error("编辑{}物流失败", logisticsBaseVo.getLogisticsName(), e);
            return ResultObj.UPDATE_ERROR;
        }
    }

    /**
     * 删除一个物流信息
     *
     * @param id 客户的ID
     * @return
     */
    @ApiOperation(value = "删除一个物流信息", notes = "删除一个物流信息")
    @ApiImplicitParams({@ApiImplicitParam(name = "id", value = "物流ID", required = true, paramType = "query", dataType = "Integer")})
    @RequestMapping(value = "delete", method = RequestMethod.POST)
    public ResultObj deleteCustomer(Integer id) {
        try {
            logisticsBaseService.deleteLogisticsBaseById(id);
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e) {
            log.error("删除物流id为：{}的物流信息失败", id, e);
            return ResultObj.DELETE_ERROR;
        }
    }


    /**
     * 加载客户所有物流的下拉列表
     *
     * @return
     */
    @RequestMapping("loadAllLogisticsBaseForSelect")
    public DataGridView loadAllCustomerLogisticsForSelect() {
        return logisticsBaseService.loadAllCustomerLogisticsForSelect();
    }

    /**
     * 加载当前店铺客户所有物流的下拉列表
     *
     * @return
     */
    @RequestMapping("loadAllProviderLogisticsForSelect")
    public DataGridView loadAllProviderLogisticsForSelect() {
        return logisticsBaseService.loadAllProviderLogisticsForSelect();
    }

}
