package com.wll.bus.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.wll.bus.entity.LogisticsBase;
import com.wll.bus.vo.LogisticsBaseVo;
import com.wll.sys.common.DataGridView;

/**
 * @Author: wll
 * @Description:
 * @Date: Created in 17:01 2020/11/17
 * @Modified By:
 */
public interface ILogisticsBaseService extends IService<LogisticsBase> {

    /**
     * 根据物流id来删除物流信息
     * @param id
     */
    void deleteLogisticsBaseById(Integer id);

    /**
     * 加载客户所有物流的下拉列表
     * @return
     */
    DataGridView loadAllProviderLogisticsForSelect();

    /**
     * 加载客户所有物流的下拉列表
     * @return
     */
    DataGridView loadAllCustomerLogisticsForSelect();

    /**
     *  查询所有的客户
     * @param logisticsBaseVo
     * @return
     */
    DataGridView loadAll(LogisticsBaseVo logisticsBaseVo);

}
