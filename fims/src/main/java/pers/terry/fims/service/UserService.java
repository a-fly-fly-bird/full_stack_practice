package pers.terry.fims.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pers.terry.fims.entity.UserEntity;
import pers.terry.fims.repository.UserRepository;

import java.util.Optional;

@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;

    public Optional<UserEntity> getFirstUser(){
        return this.userRepository.findById(1);
    }
}
