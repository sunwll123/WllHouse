package com.wll.bus.controller;


import com.wll.bus.service.IProviderService;
import com.wll.bus.vo.ProviderVo;
import com.wll.sys.common.DataGridView;
import com.wll.sys.common.ResultObj;
import com.wll.sys.common.WebUtils;
import com.wll.sys.entity.User;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * InnoDB free: 9216 kB 前端控制器
 * </p>
 *
 * @author wll
 * @since 2020-11-11
 */
@RestController
@RequestMapping("/provider")
@Log4j2
public class ProviderController {

    @Autowired
    private IProviderService providerService;

    /**
     * 查询所有的供应商
     *
     * @param providerVo
     * @return
     */
    @RequestMapping("loadAllProvider")
    public DataGridView loadAllProvider(ProviderVo providerVo) {
        return providerService.loadAllProvider(providerVo);
    }

    /**
     * 添加一个供应商
     *
     * @param providerVo
     * @return
     */
    @RequestMapping("addProvider")
    public ResultObj addProvider(ProviderVo providerVo) {
        try {
            User user = (User) WebUtils.getSession().getAttribute("user");
            providerVo.setTenantId(user.getTenantId());
            providerService.save(providerVo);
            return ResultObj.ADD_SUCCESS;
        } catch (Exception e) {
            log.error("添加｛｝供应商失败", providerVo.getProvidername(), e);
            return ResultObj.ADD_ERROR;
        }
    }

    /**
     * 修改一个供应商
     *
     * @param providerVo
     * @return
     */
    @RequestMapping("updateProvider")
    public ResultObj updateProvider(ProviderVo providerVo) {
        try {
            providerService.updateById(providerVo);
            return ResultObj.UPDATE_SUCCESS;
        } catch (Exception e) {
            log.error("编辑｛｝供应商失败", providerVo.getProvidername(), e);
            return ResultObj.UPDATE_ERROR;
        }
    }


    /**
     * 删除一个供应商
     *
     * @param id
     * @return
     */
    @RequestMapping("deleteProvider")
    public ResultObj deleteProvider(Integer id) {
        try {
            providerService.deleteProviderById(id);
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e) {
            log.error("编辑｛｝供应商失败", id, e);
            return ResultObj.DELETE_ERROR;
        }
    }


    /**
     * 加载所有可用的供应商
     *
     * @return
     */
    @RequestMapping("loadAllProviderForSelect")
    public DataGridView loadAllProviderForSelect() {
        return providerService.loadAllProviderForSelect();
    }


}

