package com.myproject.web.dao;

import com.myproject.web.domain.User;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDaoImpl implements UserDao {
    @Autowired
    private SqlSession session;
    private static final String namespace = "userMapper.";

    @Override
    public int insertUser(User user) throws Exception {
        return session.insert(namespace+"insert", user);
    }

    @Override
    public User selectUser(String id) throws Exception {
        return session.selectOne(namespace+"selectOne", id);
    }
}
