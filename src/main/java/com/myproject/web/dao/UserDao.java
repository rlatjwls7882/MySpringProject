package com.myproject.web.dao;

import com.myproject.web.domain.User;

public interface UserDao {
    int insertUser(User user) throws Exception;
    User selectUser(String id) throws Exception;
}
