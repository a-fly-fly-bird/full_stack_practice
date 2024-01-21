package pers.terry.fims.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import pers.terry.fims.entity.UserEntity;
import pers.terry.fims.service.UserService;

import java.util.Optional;

@RestController
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    @GetMapping("/all")
    public Optional<UserEntity> getUserEntity(){
        System.out.println("hello" +  this.userService.getFirstUser().toString());
        return this.userService.getFirstUser();
    }
}
