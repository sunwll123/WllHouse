package com.wll.bus.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.wll.bus.entity.Customer;
import com.wll.bus.entity.LogisticsBase;
import com.wll.bus.mapper.CustomerMapper;
import com.wll.bus.mapper.LogisticsBaseMapper;
import com.wll.bus.service.ILogisticsBaseService;
import com.wll.bus.vo.LogisticsBaseVo;
import com.wll.sys.common.DataGridView;
import com.wll.sys.common.WebUtils;
import com.wll.sys.entity.User;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import java.util.List;

/**
 * @Author: wll
 * @Description:
 * @Date: Created in 17:02 2020/11/17
 * @Modified By:
 */
@Service
@Transactional
public class LogisticsBaseServiceImpl extends ServiceImpl<LogisticsBaseMapper, LogisticsBase> implements ILogisticsBaseService {

    @Autowired
    private CustomerMapper customerMapper;

    @Override
    public void deleteLogisticsBaseById(Integer id) {
        LambdaQueryWrapper<Customer> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(Customer::getLogisticsBaseId,id);
        List<Customer> list = customerMapper.selectList(queryWrapper);
        if (CollectionUtils.isEmpty(list)){
            baseMapper.deleteById(id);
        }else {
            Customer customer = list.get(0);
            throw new RuntimeException("要删除的物流信息正在被客户" + customer.getCustomername() + "使用");
        }
    }

    @Override
    public DataGridView loadAllProviderLogisticsForSelect() {
        LambdaQueryWrapper<LogisticsBase> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.in(LogisticsBase::getType, 0,2);
        User user = (User) WebUtils.getSession().getAttribute("user");
        if (user.getTenantId() !=0 ){
            queryWrapper.eq(LogisticsBase::getTenantId,user.getTenantId());
        }
        List<LogisticsBase> list = baseMapper.selectList(queryWrapper);
        return new DataGridView(list);
    }

    @Override
    public DataGridView loadAllCustomerLogisticsForSelect() {
        LambdaQueryWrapper<LogisticsBase> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.in(LogisticsBase::getType, 0,1);
        User user = (User) WebUtils.getSession().getAttribute("user");
        if (user.getTenantId() !=0 ){
            queryWrapper.eq(LogisticsBase::getTenantId,user.getTenantId());
        }
        List<LogisticsBase> list = baseMapper.selectList(queryWrapper);
        return new DataGridView(list);
    }

    @Override
    public DataGridView loadAll(LogisticsBaseVo logisticsBaseVo) {
        //1.声明一个分页page对象
        IPage<LogisticsBase> page = new Page<>(logisticsBaseVo.getPage(), logisticsBaseVo.getLimit());
        //2.声明一个queryWrapper
        LambdaQueryWrapper<LogisticsBase> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.like(org.apache.commons.lang3.StringUtils.isNotBlank(logisticsBaseVo.getLogisticsName()), LogisticsBase::getLogisticsName, logisticsBaseVo.getLogisticsName());
        queryWrapper.like(org.apache.commons.lang3.StringUtils.isNotBlank(logisticsBaseVo.getLogisticsScope()), LogisticsBase::getLogisticsScope, logisticsBaseVo.getLogisticsScope());
        queryWrapper.like(StringUtils.isNotBlank(logisticsBaseVo.getLogisticsPhone()), LogisticsBase::getLogisticsPhone, logisticsBaseVo.getLogisticsPhone());
        queryWrapper.orderByAsc(LogisticsBase::getLogisticsCost);
        User user = (User) WebUtils.getSession().getAttribute("user");
        if (user.getTenantId() !=0 ){
            queryWrapper.eq(LogisticsBase::getTenantId,user.getTenantId());
        }
        page = baseMapper.selectPage(page, queryWrapper);
        return new DataGridView(page.getTotal(), page.getRecords());
    }

}
