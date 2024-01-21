package pers.terry.fims.entity;

import lombok.Data;
import pers.terry.fims.enums.Gender;
import pers.terry.fims.enums.UserType;

import javax.persistence.*;
import java.util.Collection;
import java.util.Objects;

@Entity
@Data
@Table(name = "user", schema = "fims")
public class UserEntity {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "user_id", nullable = false)
    private int userId;
    @Basic
    @Column(name = "account_id", nullable = false)
    private int accountId;
    @Basic
    @Column(name = "name", nullable = false, length = 50)
    private String name;
    @Basic
    @Enumerated(EnumType.STRING)
    @Column(name = "gender", nullable = true)
    private Gender gender;
    @Basic
    @Enumerated(EnumType.STRING)
    @Column(name = "user_type", nullable = true)
    private UserType userType;
    @Basic
    @Column(name = "disable", nullable = true)
    private Byte disable;
    @Basic
    @Column(name = "password", nullable = false, length = 61)
    private String password;
}
