package com.wll.bus.vo;

import com.wll.bus.entity.Customer;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @author wll
 * @since 2020-11-11
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class CustomerVo extends Customer{

    /**
     * 分页参数，当前是第一页，每页10条数据
     */
    private Integer page=1;
    private Integer limit=10;

    /**
     * 批量删除客户，存放客户ID的数组
     */
    private Integer[] ids;

    /**
     * 物流名称,用来记录客户经常需要发送的物流信息
     */
    private String logisticsName;

}
