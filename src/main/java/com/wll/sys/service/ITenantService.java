package com.wll.sys.service;

import com.wll.sys.common.DataGridView;
import com.wll.sys.entity.Tenant;
import com.baomidou.mybatisplus.extension.service.IService;
import com.wll.sys.vo.TenantVo;

/**
 * <p>
 *  租户类
 * </p>
 *
 * @author wll-
 * @since 2020-11-19
 */
public interface ITenantService extends IService<Tenant> {

    DataGridView loadAllTenant(TenantVo tenantVo);

}
