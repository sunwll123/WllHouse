package com.wll.bus.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 *
 * @Description: 物流基础信息管理entity层
 * @author wll
 * @since 2020-11-11
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("bus_logistics_base")
@ToString
public class LogisticsBase implements Serializable {

    private static final long serialVersionUID=1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;


    /**
     * 物流名称
     */
    private String logisticsName;

    /**
     * 物流覆盖区域
     */
    private String logisticsScope;


    /**
     * 物流电话
     */
    private String logisticsPhone;

    /**
     * 物流单价
     */
    private Double logisticsCost;


    /**
     * 0代表共同的物流，1代表客户，2代表供应商
     */
    private Integer type;

    /**
     * 商铺（租户）ID，0代表系统租户
     */
    private Integer tenantId;

}
