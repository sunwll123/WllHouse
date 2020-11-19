package com.wll.sys.vo;

import com.wll.sys.entity.Tenant;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @Author: 落亦-
 * @Date: 2019/11/26 11:07
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class TenantVo extends Tenant {

    private Integer page=1;
    private Integer limit=10;

}
