package com.wll.bus.vo;

import com.wll.bus.entity.LogisticsBase;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 *
 * @Description: 物流基础信息管理vo层
 * @author wll
 * @since 2020-11-11
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class LogisticsBaseVo extends LogisticsBase {

    /**
     * 分页参数，当前是第一页，每页10条数据
     */
    private Integer page=1;
    private Integer limit=10;

    /**
     * 批量删除客户，存放物流ID的数组
     */
    private Integer[] ids;

}
