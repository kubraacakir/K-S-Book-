package com.example.users.business.concretes;

import com.example.users.business.abstracts.UserService;
import com.example.users.dataAccess.UserRepository;
import com.example.users.entities.concretes.User;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class UserServiceImpl implements UserService{
    private final UserRepository userRepository;

    @Override
    public void saveUser(User user) {
        userRepository.save(user);
    }

    @Override
    public User getUser(User user) throws Exception {
        return userRepository.findByEmailAndPassword(user.getEmail(),user.getPassword()).orElseThrow(()-> new Exception("Kullanıcı Bulunamadı."));
    }
}
