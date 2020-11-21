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
 * @author wll
 * @since 2020-11-11
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("bus_provider")
@ToString
public class Provider implements Serializable {

    private static final long serialVersionUID=1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 供应商名称
     */
    private String providername;

    /**
     * 供应商地址
     */
    private String address;

    /**
     * 供应商电话
     */
    private String telephone;

    /**
     * 开户银行
     */
    private String bank;

    /**
     * 银行账号
     */
    private String account;

    /**
     * 邮箱
     */
    private String email;

    /**
     * 是否可用,1代表可用，0代表不可用
     */
    private Integer available;

    /**
     * 商铺（租户）ID，0代表系统租户
     */
    private Integer tenantId;

}
