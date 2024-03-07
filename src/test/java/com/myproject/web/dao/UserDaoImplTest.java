package com.myproject.web.dao;

import com.myproject.web.domain.User;
import com.myproject.web.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class UserDaoImplTest {
    @Autowired
    UserDao userDao;

    @Test
    public void insertUser() throws Exception {
        User user = new User("111", "1111", "asdf");
        int cnt = userDao.insertUser(user);
        System.out.println("cnt = " + cnt);
    }
}