package com.wll.sys.service.impl;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.wll.sys.common.DataGridView;
import com.wll.sys.entity.Tenant;
import com.wll.sys.mapper.TenantMapper;
import com.wll.sys.service.ITenantService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.wll.sys.vo.TenantVo;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;

/**
 * <p>
 * InnoDB free: 9216 kB 服务实现类
 * </p>
 *
 * @author luoyi-
 * @since 2019-11-26
 */
@Service
@Transactional
public class TenantServiceImpl extends ServiceImpl<TenantMapper, Tenant> implements ITenantService {

    @Override
    public Tenant getById(Serializable id) {
        return super.getById(id);
    }

    @Override
    public boolean update(Tenant entity, Wrapper<Tenant> updateWrapper) {
        return super.update(entity, updateWrapper);
    }

    @Override
    public boolean updateById(Tenant entity) {
        return super.updateById(entity);
    }

    @Override
    public boolean removeById(Serializable id) {
        return super.removeById(id);
    }

    @Override
    public boolean save(Tenant entity) {
        return super.save(entity);
    }


    @Override
    public DataGridView loadAllTenant(TenantVo tenantVo) {
        IPage<Tenant> page = new Page<>(tenantVo.getPage(), tenantVo.getLimit());
        //进行模糊查询
        LambdaQueryWrapper<Tenant> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.like(StringUtils.isNotBlank(tenantVo.getTenantName()), Tenant::getTenantName, tenantVo.getTenantName());
        queryWrapper.like(StringUtils.isNotBlank(tenantVo.getAddress()), Tenant::getAddress, tenantVo.getAddress());
        queryWrapper.orderByAsc(Tenant::getOrdernum);
        //进行查询
        page = baseMapper.selectPage(page, queryWrapper);
        //返回DataGridView
        return new DataGridView(page.getTotal(), page.getRecords());
    }
}
