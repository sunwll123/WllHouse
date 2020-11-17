package com.wll.bus.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.wll.bus.entity.LogisticsBase;
import com.wll.bus.service.ILogisticsBaseService;
import com.wll.bus.vo.LogisticsBaseVo;
import com.wll.sys.common.Constast;
import com.wll.sys.common.DataGridView;
import com.wll.sys.common.ResultObj;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import lombok.extern.log4j.Log4j2;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;


/**
 * @Author: jzl
 * @Description:
 * @Date: Created in 16:42 2020/11/17
 * @Modified By:
 */
@RestController
@RequestMapping("/logisticsBase")
@Log4j2
public class LogisticsBaseController {

    @Autowired
    private ILogisticsBaseService logisticsBaseService;

    /**
     * 查询所有的客户
     * @param logisticsBaseVo
     * @return
     */
    @RequestMapping("loadAllList")
    public DataGridView loadAllCustomer(LogisticsBaseVo logisticsBaseVo){

        //1.声明一个分页page对象
        IPage<LogisticsBase> page = new Page<>(logisticsBaseVo.getPage(),logisticsBaseVo.getLimit());
        //2.声明一个queryWrapper
        LambdaQueryWrapper<LogisticsBase> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.like(StringUtils.isNotBlank(logisticsBaseVo.getLogisticsName()),LogisticsBase::getLogisticsName,logisticsBaseVo.getLogisticsName());
        queryWrapper.like(StringUtils.isNotBlank(logisticsBaseVo.getLogisticsScope()),LogisticsBase::getLogisticsScope,logisticsBaseVo.getLogisticsScope());
        queryWrapper.like(StringUtils.isNotBlank(logisticsBaseVo.getLogisticsPhone()),LogisticsBase::getLogisticsPhone,logisticsBaseVo.getLogisticsPhone());
        queryWrapper.orderByAsc(LogisticsBase::getLogisticsCost);
        logisticsBaseService.page(page,queryWrapper);
        return new DataGridView(page.getTotal(),page.getRecords());
    }

    /**
     * 添加一个物流
     * @param logisticsBaseVo
     * @return
     */
    @RequestMapping("add")
    public ResultObj addCustomer(LogisticsBaseVo logisticsBaseVo){
        try {
            logisticsBaseService.save(logisticsBaseVo);
            return ResultObj.ADD_SUCCESS;
        } catch (Exception e) {
            log.error("新增{}物流信息失败",logisticsBaseVo.getLogisticsName(),e);
            return ResultObj.ADD_ERROR;
        }
    }

    /**
     * 修改一个物流信息
     * @param logisticsBaseVo
     * @return
     */
    @RequestMapping("update")
    public ResultObj updateCustomer(LogisticsBaseVo logisticsBaseVo){
        try {
            logisticsBaseService.updateById(logisticsBaseVo);
            return ResultObj.UPDATE_SUCCESS;
        } catch (Exception e) {
            log.error("编辑{}物流失败",logisticsBaseVo.getLogisticsName(),e);
            return ResultObj.UPDATE_ERROR;
        }
    }

    /**
     * 删除一个物流信息
     * @param id 客户的ID
     * @return
     */
    @ApiOperation(value = "删除一个物流信息",notes = "删除一个物流信息")
    @ApiImplicitParams({@ApiImplicitParam(name = "id", value = "物流ID",required = true,paramType = "query",dataType = "Integer")})
    @RequestMapping(value = "delete",method = RequestMethod.POST)
    public ResultObj deleteCustomer(Integer id){
        try {
            logisticsBaseService.removeById(id);
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e) {
            log.error("删除物流id为：{}的物流信息失败",id,e);
            return ResultObj.DELETE_ERROR;
        }
    }


    /**
     * 加载所有物流的下拉列表
     * @return
     */
    @RequestMapping("loadAllLogisticsBaseForSelect")
    public DataGridView loadAllCustomerForSelect(){
        LambdaQueryWrapper<LogisticsBase> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(LogisticsBase::getAvailable, Constast.AVAILABLE_TRUE);
        List<LogisticsBase> list = logisticsBaseService.list(queryWrapper);
        return new DataGridView(list);
    }

}
