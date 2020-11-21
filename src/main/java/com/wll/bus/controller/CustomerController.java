package com.wll.bus.controller;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.wll.bus.service.ICustomerService;
import com.wll.bus.vo.CustomerVo;
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
 * <p>
 * InnoDB free: 9216 kB 前端控制器
 * </p>
 *
 * @author wll
 * @since 2019-12-05
 */
@RestController
@RequestMapping("/customer")
@Log4j2
public class CustomerController {

    @Autowired
    private ICustomerService customerService;

    /**
     * 查询所有的客户
     * @param customerVo
     * @return
     */
    @RequestMapping("loadAllCustomer")
    public DataGridView loadAllCustomer(CustomerVo customerVo){
        //1.声明一个分页page对象
        IPage<CustomerVo> page = customerService.list(customerVo);
        return new DataGridView(page.getTotal(),page.getRecords());
    }

    /**
     * 添加一个客户
     * @param customerVo
     * @return
     */
    @RequestMapping("addCustomer")
    public ResultObj addCustomer(CustomerVo customerVo){
        try {
            User user = (User) WebUtils.getSession().getAttribute("user");
            customerVo.setTenantId(user.getTenantId());
            customerService.save(customerVo);
            return ResultObj.ADD_SUCCESS;
        } catch (Exception e) {
            log.error("添加｛｝客户失败",customerVo.getCustomername(),e);
            return ResultObj.ADD_ERROR;
        }
    }

    /**
     * 修改一个客户
     * @param customerVo
     * @return
     */
    @RequestMapping("updateCustomer")
    public ResultObj updateCustomer(CustomerVo customerVo){
        try {
            customerService.updateById(customerVo);
            return ResultObj.UPDATE_SUCCESS;
        } catch (Exception e) {
            log.error("编辑｛｝客户失败",customerVo.getCustomername(),e);
            return ResultObj.UPDATE_ERROR;
        }
    }

    /**
     * 删除一个客户
     * @param id 客户的ID
     * @return
     */
    @ApiOperation(value = "删除一个客户",notes = "删除一个客户")
    @ApiImplicitParams({@ApiImplicitParam(name = "id", value = "客户ID",required = true,paramType = "query",dataType = "Integer")})
    @RequestMapping(value = "deleteCustomer",method = RequestMethod.POST)
    public ResultObj deleteCustomer(Integer id){
        try {
            customerService.deleteCustomerById(id);
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e) {
            log.error("删除｛｝客户失败",id,e);
            return ResultObj.DELETE_ERROR;
        }
    }


    /**
     * 加载当前店铺所有客户的下拉列表
     * @return
     */
    @RequestMapping("loadAllCustomerForSelect")
    public DataGridView loadAllCustomerForSelect(){
        return customerService.loadAllCustomerForSelect();
    }

}

