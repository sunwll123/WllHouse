package com.wll.bus.vo;

import com.wll.bus.entity.Inport;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * @author wll
 * @since 2020-11-11
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class InportVo extends Inport {

    private Integer page = 1;

    private Integer limit = 10;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date startTime;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date endTime;

}
