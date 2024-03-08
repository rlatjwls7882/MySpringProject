package com.myproject.web.dao;

import com.myproject.web.domain.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class UserDaoImplTest {
    @Autowired
    UserDao userDao;

    @Test
    public void insertUserTest() throws Exception {
        User user = new User("111", "1111", "asdf");
        int cnt = userDao.insertUser(user);
        System.out.println("cnt = " + cnt);
    }
    @Test
    public void selectUserTest() throws Exception {
        User input = new User("a", "a", "a");
        User user = userDao.selectUser(input.getId());
        try {
            if(input.getId().equals(user.getId())){
                System.out.println("예외X, 동일");
            } else {
                System.out.println("예외X, 다름");
            }
        } catch (Exception e){
            System.out.println("예외 발생");
        }
        System.out.println("user = " + user);
    }
}
