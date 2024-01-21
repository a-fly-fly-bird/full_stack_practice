package pers.terry.fims.entity;

import lombok.Data;

import javax.persistence.*;
import java.util.Collection;
import java.util.Objects;

@Entity
@Data
@Table(name = "account", schema = "fims")
public class AccountEntity {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "account_id", nullable = false)
    private int accountId;
    @Basic
    @Column(name = "balance", nullable = false, precision = 0)
    private int balance;
}
