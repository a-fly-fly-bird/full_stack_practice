package pers.terry.fims.mapper;

import org.apache.ibatis.annotations.Mapper;

import pers.terry.fims.entity.UserEntity;

@Mapper
public interface UserMapper {
    int insertUser(UserEntity user);

    UserEntity findById();
}
