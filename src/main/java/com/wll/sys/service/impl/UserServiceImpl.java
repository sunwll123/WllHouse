package com.wll.sys.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.wll.sys.common.Constast;
import com.wll.sys.common.DataGridView;
import com.wll.sys.common.WebUtils;
import com.wll.sys.entity.Tenant;
import com.wll.sys.entity.User;
import com.wll.sys.mapper.RoleMapper;
import com.wll.sys.mapper.TenantMapper;
import com.wll.sys.mapper.UserMapper;
import com.wll.sys.service.IUserService;
import com.wll.sys.vo.UserVo;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * <p>
 * InnoDB free: 9216 kB; (`deptid`) REFER `warehouse/sys_dept`(`id`) ON UPDATE CASC 服务实现类
 * </p>
 *
 * @author luoyi-
 * @since 2019-11-21
 */
@Service
@Transactional
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements IUserService {

    @Autowired
    private RoleMapper roleMapper;

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private TenantMapper tenantMapper;

    @Override
    public boolean save(User entity) {
        return super.save(entity);
    }

    @Override
    public boolean updateById(User entity) {
        return super.updateById(entity);
    }

    @Override
    public User getById(Serializable id) {
        return super.getById(id);
    }

    @Override
    public boolean removeById(Serializable id) {
        //根据用户id删除用户角色中间表的数据
        roleMapper.deleteRoleUserByUid(id);
        //删除用户头像[如果是默认头像不删除，否则删除]

        return super.removeById(id);
    }

    /**
     * 保存用户和角色的关系
     *
     * @param uid 用户的ID
     * @param ids 用户拥有的角色的ID的数组
     */
    @Override
    public void saveUserRole(Integer uid, Integer[] ids) {
        //1.根据用户ID删除sys_user_role里面的数据
        roleMapper.deleteRoleUserByUid(uid);
        if (null != ids && ids.length > 0) {
            for (Integer rid : ids) {
                roleMapper.insertUserRole(uid, rid);
            }
        }
    }

    /**
     * 查询当前用户是否是其他用户的直属领导
     *
     * @param userId 当前用户ID
     * @return true:是  false:否
     */
    @Override
    public Boolean queryMgrByUserId(Integer userId) {
        QueryWrapper<User> queryWrapper = new QueryWrapper<User>();
        queryWrapper.eq("mgr", userId);
        List<User> users = userMapper.selectList(queryWrapper);
        if (null != users && users.size() > 0) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public DataGridView loadAllUser(UserVo userVo) {

        IPage<User> page = new Page<User>(userVo.getPage(), userVo.getLimit());
        LambdaQueryWrapper<User> queryWrapper = new LambdaQueryWrapper<>();
        //根据用户登录名称以及用户名称模糊查询用户
        queryWrapper.like(StringUtils.isNotBlank(userVo.getName()), User::getName, userVo.getName()).or().eq(StringUtils.isNotBlank(userVo.getName()), User::getLoginname, userVo.getName());
        queryWrapper.like(StringUtils.isNotBlank(userVo.getAddress()), User::getAddress, userVo.getAddress());
        queryWrapper.eq(userVo.getTenantId() != null && userVo.getTenantId()!=0, User::getTenantId, userVo.getTenantId());
        //查询系统用户
        queryWrapper.eq(User::getType, Constast.USER_TYPE_NORMAL);
        queryWrapper.orderByDesc(User::getId);
        User user = (User) WebUtils.getSession().getAttribute("user");
        if (user.getTenantId() != 0){
            queryWrapper.eq(User::getTenantId,user.getTenantId());
        }
        page = baseMapper.selectPage(page, queryWrapper);

        //将所有用户数据放入list中
        List<User> list = page.getRecords();
        if (CollectionUtils.isEmpty(list)) {
            return new DataGridView(page.getTotal(), null);
        }
        List<UserVo> data = new ArrayList<>();
        LambdaQueryWrapper<Tenant> tenantWraaper = new LambdaQueryWrapper<>();
        tenantWraaper.eq(Tenant::getAvailable, 1);
        List<Tenant> tenants = tenantMapper.selectList(tenantWraaper);
        Map<Integer, String> tenantMap = tenants.stream().collect(Collectors.toMap(Tenant::getId, Tenant::getTenantName));
        //  根据租户ID查询租户名称
        for (User usr : list) {
            UserVo vo = new UserVo();
            vo.setId(usr.getId());
            vo.setTenantId(usr.getTenantId());
            vo.setPwd(usr.getPwd());
            vo.setImgpath(usr.getImgpath());
            vo.setAddress(usr.getAddress());
            vo.setSalt(usr.getSalt());
            vo.setSex(usr.getSex());
            vo.setHiredate(usr.getHiredate());
            vo.setLimit(userVo.getLimit());
            vo.setPage(userVo.getPage());
            vo.setAvailable(usr.getAvailable());
            vo.setLoginname(usr.getLoginname());
            vo.setName(usr.getName());
            vo.setOrdernum(usr.getOrdernum());
            vo.setRemark(usr.getRemark());
            vo.setType(usr.getType());
            vo.setTenantName(tenantMap.get(usr.getTenantId()));
            data.add(vo);
        }
        return new DataGridView(page.getTotal(), data);
    }
}
