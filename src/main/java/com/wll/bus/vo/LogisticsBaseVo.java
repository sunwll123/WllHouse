package com.wll.bus.vo;

import com.wll.bus.entity.LogisticsBase;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @Author: jzl
 * @Description:
 * @Date: Created in 16:52 2020/11/17
 * @Modified By:
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
