package pers.terry.fims.entity;

import lombok.Data;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Objects;

@Entity
@Data
@Table(name = "transaction", schema = "fims")
public class TransactionEntity {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "transaction_id", nullable = false)
    private int transactionId;
    @Basic
    @Column(name = "stock_id", nullable = true)
    private Integer stockId;
    @Basic
    @Column(name = "fund_id", nullable = true)
    private Integer fundId;
    @Basic
    @Column(name = "bond_id", nullable = true)
    private Integer bondId;
    @Basic
    @Column(name = "quantity", nullable = true)
    private Integer quantity;
    @Basic
    @Column(name = "price", nullable = true, precision = 0)
    private Integer price;
    @Basic
    @Column(name = "date", nullable = false)
    private Timestamp date;
    @Basic
    @Column(name = "user_id", nullable = false)
    private int userId;
}
