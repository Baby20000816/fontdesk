package com.soft1813.jianshu2.entity;

import lombok.Data;

import java.time.LocalDate;

/**
 * @author mq_xu
 * @ClassName User
 * @Description 用户实体类
 * @Date 2019/10/08
 * @Version 1.0
 **/
@Data
public class User {
    private Integer id;
    private String name;
    private String producter;
    private String download;
    private String avatar;
    private String look;
    private LocalDate upDate;
    private String description;
}
