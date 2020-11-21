package com.wll.bus.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.wll.bus.entity.Goods;
import com.wll.bus.vo.GoodsVo;
import com.wll.sys.common.DataGridView;

import java.util.List;

/**
 * <p>
 * InnoDB free: 9216 kB; (`providerid`) REFER `warehouse/bus_provider`(`id`) 服务类
 * </p>
 *
 * @author wll
 * @since 2020-11-11
 */
public interface IGoodsService extends IService<Goods> {

    /**
     * 根据商品id删除商品
     * @param id
     */
    void deleteGoodsById(Integer id);

    /**
     * 加载所有的库存预警商品
     * @return
     */
    List<GoodsVo> loadAllWarning();

    DataGridView loadAllGoods(GoodsVo goodsVo);

    DataGridView loadAllGoodsList(GoodsVo goodsVo);
}
