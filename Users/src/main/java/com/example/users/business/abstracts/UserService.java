package com.example.users.business.abstracts;

import com.example.users.entities.concretes.User;

public interface UserService {
    void saveUser(User user);

    User getUser(User user) throws Exception;
}
