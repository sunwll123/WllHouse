package com.wll.bus.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.wll.bus.entity.Customer;
import com.wll.bus.entity.LogisticsBase;
import com.wll.bus.mapper.CustomerMapper;
import com.wll.bus.mapper.LogisticsBaseMapper;
import com.wll.bus.service.ILogisticsBaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

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

}
