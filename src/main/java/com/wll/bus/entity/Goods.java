package com.wll.bus.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 * <p>
 * InnoDB free: 9216 kB; (`providerid`) REFER `warehouse/bus_provider`(`id`)
 * </p>
 *
 * @author wll
 * @since 2020-11-11
 */
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("bus_goods")
@ToString
@Data
public class Goods implements Serializable {

    private static final long serialVersionUID=1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 商品名称
     */
    private String goodsname;
    /**
     * 商品产地
     */
    private String produceplace;

    /**
     * 产品规格
     */

    private String size;

    /**
     * 包装
     */
    private String goodspackage;

    /**
     * 生产批号
     */
    private String productcode;

    /**
     * 批准文号
     */
    private String promitcode;
    /**
     * 商品描述
     */
    private String description;

    /**
     * 商品单价（对应规格）
     */
    private Double price;

    /**
     * 库存量
     */
    private Integer number;

    /**
     * 商品预警值
     */
    private Integer dangernum;

    /**
     * 商品图片
     */
    private String goodsimg;

    /**
     * 是否可用,是否下架该商品
     */
    private Integer available;

    /**
     * 供应商ID
     */
    private Integer providerid;

    /**
     * 商铺（租户）ID，0代表系统租户
     */
    private Integer tenantId;


}
