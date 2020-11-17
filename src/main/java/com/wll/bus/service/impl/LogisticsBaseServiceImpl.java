package com.wll.bus.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.wll.bus.entity.LogisticsBase;
import com.wll.bus.mapper.LogisticsBaseMapper;
import com.wll.bus.service.ILogisticsBaseService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @Author: jzl
 * @Description:
 * @Date: Created in 17:02 2020/11/17
 * @Modified By:
 */
@Service
@Transactional
public class LogisticsBaseServiceImpl extends ServiceImpl<LogisticsBaseMapper, LogisticsBase> implements ILogisticsBaseService {


}
