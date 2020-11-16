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
 * <p>
 * InnoDB free: 9216 kB
 * </p>
 *
 * @author luoyi-
 * @since 2019-12-05
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("bus_customer")
@ToString
public class Customer implements Serializable {

    private static final long serialVersionUID=1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 客户姓名
     */
    private String customername;

    /**
     * 客户地址
     */
    private String address;

    /**
     * 客户电话
     */
    private String phone;


    /**
     * 物流名称,用来记录客户经常需要发送的物流信息
     */
    private String logisticsName;

    /**
     * 物流电话
     */
    private String logisticsPhone;


    /**
     * 0代表不可用，1代表可用
     */
    private Integer available;


}
