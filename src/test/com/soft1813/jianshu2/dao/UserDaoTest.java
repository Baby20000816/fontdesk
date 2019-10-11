package com.soft1813.jianshu2.dao;

import cn.hutool.db.Entity;
import com.soft1813.jianshu2.factory.DaoFactory;
import org.junit.Test;
import java.sql.SQLException;
import java.util.List;

public class UserDaoTest {
    private UserDao userDao = DaoFactory.getUserDaoInstance();

    @Test
    public void findAll() throws SQLException {

        List<Entity> entityList = userDao.findAll();
        entityList.forEach(System.out::println);
    }

}