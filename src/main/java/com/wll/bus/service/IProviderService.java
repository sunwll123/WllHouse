package com.wll.bus.service;

import com.wll.bus.entity.Provider;
import com.baomidou.mybatisplus.extension.service.IService;
import com.wll.bus.vo.ProviderVo;
import com.wll.sys.common.DataGridView;

/**
 * <p>
 * InnoDB free: 9216 kB 服务类
 * </p>
 *
 * @author wll
 * @since 2020-11-11
 */
public interface IProviderService extends IService<Provider> {

    /**
     * 根据供应商ID删除供应商
     * @param id
     */
    void deleteProviderById(Integer id);

    /**
     *  加载所有供应商
     * @param providerVo
     * @return
     */
    DataGridView loadAllProvider(ProviderVo providerVo);

    /**
     * 加载所有可用的供应商
     * @return
     */
    DataGridView loadAllProviderForSelect();

}
