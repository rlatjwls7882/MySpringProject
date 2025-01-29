package com.myproject.web.service;

import com.myproject.web.domain.User;

public interface UserService {
    int createUser(User user) throws Exception;
    boolean checkUser(User userInput) throws Exception;
    User searchUser(String id) throws Exception;
}
