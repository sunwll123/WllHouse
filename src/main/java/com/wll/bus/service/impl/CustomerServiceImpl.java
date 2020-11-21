package com.wll.bus.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.wll.bus.entity.Customer;
import com.wll.bus.mapper.CustomerMapper;
import com.wll.bus.mapper.GoodsMapper;
import com.wll.bus.service.ICustomerService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.wll.bus.vo.CustomerVo;
import com.wll.sys.common.Constast;
import com.wll.sys.common.DataGridView;
import com.wll.sys.common.WebUtils;
import com.wll.sys.entity.User;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;

/**
 * <p>
 * InnoDB free: 9216 kB 服务实现类
 * </p>
 *
 * @author luoyi-
 * @since 2019-12-05
 */
@Service
@Transactional
public class CustomerServiceImpl extends ServiceImpl<CustomerMapper, Customer> implements ICustomerService {

    @Autowired
    private GoodsMapper goodsMapper;
    @Autowired
    private CustomerMapper customerMapper;

    @Override
    public boolean save(Customer entity) {
        return super.save(entity);
    }

    @Override
    public boolean updateById(Customer entity) {
        return super.updateById(entity);
    }

    @Override
    public boolean removeById(Serializable id) {
        return super.removeById(id);
    }
    @Override
    public Customer getById(Serializable id) {
        return super.getById(id);
    }

    @Override
    public boolean removeByIds(Collection<? extends Serializable> idList) {
        return super.removeByIds(idList);
    }

    /**
     * 根据客户id删除客户
     * @param id    客户id
     */
    @Override
    public void deleteCustomerById(Integer id) {
        //根据客户id删除商品销售
        goodsMapper.deleteSaleByCustomerId(id);
        //根据客户id删除商品销售退货
        goodsMapper.deleteSaleBackByCustomerId(id);
        this.removeById(id);
    }

    @Override
    public IPage<CustomerVo> list(CustomerVo customerVo) {
        IPage<CustomerVo> page = new Page<>();
        page.setSize(customerVo.getLimit());
        page.setCurrent(customerVo.getPage());
        User user = (User) WebUtils.getSession().getAttribute("user");
        return customerMapper.selectListByCondition(page,customerVo.getCustomername(),customerVo.getPhone(),customerVo.getLogisticsBaseId(),user.getTenantId());
    }

    @Override
    public DataGridView loadAllCustomerForSelect() {
        LambdaQueryWrapper<Customer> queryWrapper = new LambdaQueryWrapper<Customer>();
        queryWrapper.eq(Customer::getAvailable, Constast.AVAILABLE_TRUE);
        User user = (User) WebUtils.getSession().getAttribute("user");
        if (user.getTenantId() != 0){
            queryWrapper.eq(Customer::getTenantId,user.getTenantId());
        }
        List<Customer> list = baseMapper.selectList(queryWrapper);
        return new DataGridView(list);
    }
}
