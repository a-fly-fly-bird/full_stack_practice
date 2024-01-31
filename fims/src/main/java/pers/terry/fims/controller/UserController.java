package pers.terry.fims.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import pers.terry.fims.entity.UserEntity;
import pers.terry.fims.service.UserService;

import java.util.Optional;

@RestController
@RequestMapping("/user")
@Api(tags = "用户模块", value = "用户UserController")
public class UserController {
    @Autowired
    private UserService userService;

    @GetMapping("/all")
    @ApiOperation("获取用户")
    public Optional<UserEntity> getUserEntity(){
        System.out.println("hello" +  this.userService.getFirstUser().toString());
        return this.userService.getFirstUser();
    }
}
