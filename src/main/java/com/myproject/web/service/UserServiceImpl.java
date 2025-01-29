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

    @Override
    public boolean checkUser(User userInput) throws Exception {
        User userFromId = userDao.selectUser(userInput.getId());
        if(userFromId == null) return false;
        return userInput.getPassword().equals(userFromId.getPassword());
    }

    @Override
    public User searchUser(String id) throws Exception {
        return userDao.selectUser(id);
    }
}
