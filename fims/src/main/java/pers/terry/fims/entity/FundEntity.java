package pers.terry.fims.entity;

import lombok.Data;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Collection;
import java.util.Objects;

@Entity
@Data
@Table(name = "fund", schema = "fims")
public class FundEntity {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "fund_id", nullable = false)
    private int fundId;
    @Basic
    @Column(name = "name", nullable = false, length = 50)
    private String name;
    @Basic
    @Column(name = "code", nullable = false, length = 50)
    private String code;
    @Basic
    @Column(name = "date", nullable = false)
    private Timestamp date;
    @Basic
    @Column(name = "open", nullable = true, precision = 6)
    private Double open;
    @Basic
    @Column(name = "high", nullable = true, precision = 6)
    private Double high;
    @Basic
    @Column(name = "low", nullable = true, precision = 6)
    private Double low;
    @Basic
    @Column(name = "close", nullable = true, precision = 6)
    private Double close;
    @Basic
    @Column(name = "adj_close", nullable = true, precision = 6)
    private Double adjClose;
    @Basic
    @Column(name = "volume", nullable = true)
    private Integer volume;
}
