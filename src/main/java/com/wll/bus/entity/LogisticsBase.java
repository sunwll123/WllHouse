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
 * @Author: jzl
 * @Description:
 * @Date: Created in 15:13 2020/11/17
 * @Modified By:
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
     * 0代表不可用，1代表可用
     */
    private Integer available;


}
