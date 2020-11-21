package com.wll.bus.vo;

import com.baomidou.mybatisplus.annotation.TableField;
import com.wll.bus.entity.Goods;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @author wll
 * @since 2020-11-11
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class GoodsVo extends Goods {

    private Integer page=1;
    private Integer limit=10;

    /**
     *
     */
    @TableField(exist = false)
    private String providername;

}
