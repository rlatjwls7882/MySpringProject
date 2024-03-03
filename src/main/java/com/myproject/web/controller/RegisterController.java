package com.myproject.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class RegisterController {
    @GetMapping("/register")
    public String registerForm() {
        return "registerForm";
    }

    @PostMapping("/register")
    public void register(String id, String pwd, String name) {
        System.out.println("id = " + id);
        System.out.println("pwd = " + pwd);
        System.out.println("name = " + name);
    }
}