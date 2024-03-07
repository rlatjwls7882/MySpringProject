package com.myproject.web.controller;

import com.myproject.web.domain.User;
import com.myproject.web.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class RegisterController {
    @Autowired
    UserService userService;

    @GetMapping("/register")
    public String registerForm() {
        return "registerForm";
    }

    @PostMapping("/register")
    public String register(User user, Model m, RedirectAttributes rattr) {
        System.out.println("user = " + user);

        try {
            int changeCnt = userService.createUser(user);

            if(changeCnt!=1) {
                throw new Exception();
            }
            rattr.addFlashAttribute("msg", "register_success");
            return "redirect:/";
        } catch (Exception e) {
            // 아이디 중복 등의 오류 발생
            rattr.addFlashAttribute("msg", "register_failed");
            return "redirect:/register";
        }
    }
}