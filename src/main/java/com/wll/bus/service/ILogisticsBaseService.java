package com.wll.bus.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.wll.bus.entity.LogisticsBase;

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

}
