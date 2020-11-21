package com.wll.bus.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.wll.bus.entity.Goods;
import com.wll.bus.entity.Provider;
import com.wll.bus.mapper.GoodsMapper;
import com.wll.bus.mapper.ProviderMapper;
import com.wll.bus.service.IProviderService;
import com.wll.bus.vo.GoodsVo;
import com.wll.bus.vo.ProviderVo;
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
public class ProviderServiceImpl extends ServiceImpl<ProviderMapper, Provider> implements IProviderService {

    @Autowired
    private GoodsMapper goodsMapper;

    @Override
    public boolean save(Provider entity) {
        return super.save(entity);
    }

    @Override
    public boolean updateById(Provider entity) {
        return super.updateById(entity);
    }

    @Override
    public boolean removeById(Serializable id) {
        return super.removeById(id);
    }
    @Override
    public Provider getById(Serializable id) {
        return super.getById(id);
    }

    @Override
    public boolean removeByIds(Collection<? extends Serializable> idList) {
        return super.removeByIds(idList);
    }

    /**
     * 根据供应商id删除供应商
     * @param id    供应商id
     */
    @Override
    public void deleteProviderById(Integer id) {
        //根据供应商id查询出商品id
        QueryWrapper<Goods> queryWrapper = new QueryWrapper<Goods>();
        queryWrapper.eq("providerid",id);
        List<Goods> goods = goodsMapper.selectList(queryWrapper);
        for (Goods good : goods) {
            //获取一个商品id
            Integer id1 = good.getId();
            //根据商品id删除商品销售信息
            goodsMapper.deleteSaleByGoodsId(id1);
            //根据商品id删除商品销售退货信息
            goodsMapper.deleteSaleBackByGoodsId(id1);
        }
        //根据供应商id删除商品退货信息
        this.getBaseMapper().deleteOutPortByProviderId(id);
        //根据供应商id删除商品进货信息
        this.getBaseMapper().deleteInportByProviderId(id);
        //根据供应商id删除商品
        this.getBaseMapper().deleteGoodsByProviderId(id);
        //删除供应商
        this.removeById(id);
    }

    @Override
    public DataGridView loadAllProvider(ProviderVo providerVo) {
        //1.声明一个分页page对象
        IPage<Provider> page = new Page(providerVo.getPage(),providerVo.getLimit());
        //2.声明一个queryWrapper
        LambdaQueryWrapper<Provider> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.like(StringUtils.isNotBlank(providerVo.getProvidername()),Provider::getProvidername,providerVo.getProvidername());
        queryWrapper.like(StringUtils.isNotBlank(providerVo.getAddress()),Provider::getAddress,providerVo.getAddress());
        queryWrapper.like(StringUtils.isNotBlank(providerVo.getTelephone()),Provider::getTelephone,providerVo.getTelephone());
        queryWrapper.eq(Provider::getAvailable, Constast.AVAILABLE_TRUE);
        User user = (User) WebUtils.getSession().getAttribute("user");
        if (user.getTenantId() != 0){
            queryWrapper.eq(Provider::getTenantId,user.getTenantId());
        }
        queryWrapper.orderByDesc(Provider::getProvidername);
        page = baseMapper.selectPage(page,queryWrapper);
        return new DataGridView(page.getTotal(),page.getRecords());
    }

    @Override
    public DataGridView loadAllProviderForSelect() {
        LambdaQueryWrapper<Provider> queryWrapper = new LambdaQueryWrapper<Provider>();
        queryWrapper.eq(Provider::getAvailable, Constast.AVAILABLE_TRUE);
        User user = (User) WebUtils.getSession().getAttribute("user");
        if (user.getTenantId() != 0){
            queryWrapper.eq(Provider::getTenantId,user.getTenantId());
        }
        List<Provider> list = baseMapper.selectList(queryWrapper);
        return new DataGridView(list);
    }


}
