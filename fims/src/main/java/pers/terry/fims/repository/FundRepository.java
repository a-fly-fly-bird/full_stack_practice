package pers.terry.fims.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pers.terry.fims.entity.FundEntity;

import java.util.List;

@Repository
public interface FundRepository extends JpaRepository<FundEntity, Integer> {
    List<FundEntity> findByAdjCloseBetween(double start, double end);
}
