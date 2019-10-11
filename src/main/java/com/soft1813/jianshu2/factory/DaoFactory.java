package com.soft1813.jianshu2.factory;

import com.soft1813.jianshu2.dao.UserDao;
import com.soft1813.jianshu2.dao.impl.UserDaoImpl;
/**
 * @author jh_wu
 * @ClassName DaoFactory
 * @Description TODO
 * @Date 2019/10/10:21:26
 * @Version 1.0
 **/
public class DaoFactory {
    public static UserDao getUserDaoInstance(){
        return new UserDaoImpl();
    }
}