package com.wll.sys.service.impl;

import com.wll.sys.entity.Loginfo;
import com.wll.sys.mapper.LoginfoMapper;
import com.wll.sys.service.ILoginfoService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * <p>
 * InnoDB free: 9216 kB 服务实现类
 * </p>
 *
 * @author luoyi-
 * @since 2019-11-23
 */
@Service
@Transactional
public class LoginfoServiceImpl extends ServiceImpl<LoginfoMapper, Loginfo> implements ILoginfoService {

}