package com.myproject.web.service;

import com.myproject.web.dao.UserDao;
import com.myproject.web.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserDao userDao;

    @Override
    public int createUser(User user) throws Exception {
        return userDao.insertUser(user);
    }
}
