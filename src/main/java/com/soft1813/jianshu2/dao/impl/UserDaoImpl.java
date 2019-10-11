package com.soft1813.jianshu2.dao.impl;

import cn.hutool.db.Db;
import cn.hutool.db.Entity;
import com.soft1813.jianshu2.dao.UserDao;
import com.soft1813.jianshu2.entity.User;

import java.sql.SQLException;
import java.util.List;

/**
 * @author zh_yan
 * @ClassName UserDaoImpl
 * @Description TODO
 * @Date 2019/10/8
 * @Version 1.0
 **/
public class UserDaoImpl implements UserDao {
    @Override
    public List<Entity> findAll() throws SQLException {
        return Db.use().query("SELECT * FROM t_user ORDER BY id DESC");
    }
}
