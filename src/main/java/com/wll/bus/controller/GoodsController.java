package com.wll.bus.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.wll.bus.entity.Goods;
import com.wll.bus.entity.Provider;
import com.wll.bus.service.IGoodsService;
import com.wll.bus.service.IProviderService;
import com.wll.bus.vo.GoodsVo;
import com.wll.sys.common.*;
import com.wll.sys.entity.User;
import lombok.extern.log4j.Log4j2;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * <p>
 * InnoDB free: 9216 kB; (`providerid`) REFER `warehouse/bus_provider`(`id`) 前端控制器
 * </p>
 *
 * @author wll
 * @since 2020-11-11
 */
@RestController
@RequestMapping("/goods")
@Log4j2
public class GoodsController {

    @Autowired
    private IGoodsService goodsService;

    @Autowired
    private IProviderService providerService;

    /**
     * 查询商品
     *
     * @param goodsVo
     * @return
     */
    @RequestMapping("loadAllGoods")
    public DataGridView loadAllGoods(GoodsVo goodsVo) {
        return goodsService.loadAllGoods(goodsVo);
    }

    /**
     * 添加商品
     *
     * @param goodsVo
     * @return
     */
    @RequestMapping("addGoods")
    public ResultObj addGoods(GoodsVo goodsVo) {
        try {
            User user = (User) WebUtils.getSession().getAttribute("user");
            goodsVo.setTenantId(user.getTenantId());
            if (goodsVo.getGoodsimg() != null && goodsVo.getGoodsimg().endsWith("_temp")) {
                String newName = AppFileUtils.renameFile(goodsVo.getGoodsimg());
                goodsVo.setGoodsimg(newName);
            }
            goodsService.save(goodsVo);
            return ResultObj.ADD_SUCCESS;
        } catch (Exception e) {
            log.error("新增商品{}失败",goodsVo.getGoodsname(),e);
            return ResultObj.ADD_ERROR;
        }
    }

    /**
     * 修改商品
     *
     * @param goodsVo
     * @return
     */
    @RequestMapping("updateGoods")
    public ResultObj updateGoods(GoodsVo goodsVo) {
        try {
            //商品图片不是默认图片
            if (!(goodsVo.getGoodsimg() != null && goodsVo.getGoodsimg().equals(Constast.DEFAULT_IMG_GOODS))) {

                if (goodsVo.getGoodsimg().endsWith("_temp")) {
                    String newName = AppFileUtils.renameFile(goodsVo.getGoodsimg());
                    goodsVo.setGoodsimg(newName);
                    //删除原先的图片
                    String oldPath = goodsService.getById(goodsVo.getId()).getGoodsimg();
                    AppFileUtils.removeFileByPath(oldPath);
                }
            }
            goodsService.updateById(goodsVo);
            return ResultObj.UPDATE_SUCCESS;
        } catch (Exception e) {
            log.error("编辑商品{}失败",goodsVo.getGoodsname(),e);
            return ResultObj.UPDATE_ERROR;
        }
    }

    /**
     * 删除商品
     *
     * @param id 商品id
     * @return
     */
    @RequestMapping("deleteGoods")
    public ResultObj deleteGoods(Integer id, String goodsimg) {
        try {
            //删除商品的图片
            AppFileUtils.removeFileByPath(goodsimg);
            goodsService.deleteGoodsById(id);
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e) {
            log.error("删除商品｛｝失败", id, e);
            return ResultObj.DELETE_ERROR;
        }
    }

    /**
     * 加载所有可用的商品
     *
     * @return
     */
    @RequestMapping("loadAllGoodsForSelect")
    public DataGridView loadAllGoodsForSelect() {
        return goodsService.loadAllGoodsList(new GoodsVo());
    }

    /**
     * 根据供应商ID查询商品信息
     *
     * @param providerid 供应商ID
     * @return
     */
    @RequestMapping("loadGoodsByProviderId")
    public DataGridView loadGoodsByProviderId(Integer providerid) {
        GoodsVo goodsVo = new GoodsVo();
        goodsVo.setProviderid(providerid);
        return goodsService.loadAllGoodsList(goodsVo);
    }

    /**
     * 加载所有的库存预警商品
     *
     * @return
     */
    @RequestMapping("loadAllWarningGoods")
    public DataGridView loadAllWarningGoods() {
        List<GoodsVo> goods = goodsService.loadAllWarning();
        return new DataGridView((long) goods.size(), goods);
    }


}

