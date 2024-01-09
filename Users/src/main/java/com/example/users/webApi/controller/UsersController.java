package com.example.users.webApi.controller;

import com.example.users.business.abstracts.UserService;
import com.example.users.entities.concretes.User;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/users")
@CrossOrigin()
@RequiredArgsConstructor

public class UsersController {
    private final UserService userService;

    @GetMapping("/get")
    public User getUser(User user) throws Exception {
        return userService.getUser(user);
    }

    @PostMapping("/save")
    public void saveUser(@RequestBody User user){
        this.userService.saveUser(user);
    }

}
