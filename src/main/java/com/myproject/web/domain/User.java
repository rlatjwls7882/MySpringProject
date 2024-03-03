package com.myproject.web.domain;

public class User {
    private String id;
    private String pwd;
    private String name;

    @Override
    public String toString() {
        return "UserDao{" +
                "id='" + id + '\'' +
                ", password='" + pwd + '\'' +
                ", name='" + name + '\'' +
                '}';
    }

    public User(String id, String pwd, String name) {
        this.id = id;
        this.pwd = pwd;
        this.name = name;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String password) {
        this.pwd = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
