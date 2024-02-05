package pers.terry.fims.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import pers.terry.fims.entity.FundEntity;

@Repository
public interface FundRepository extends JpaRepository<FundEntity, Integer> {
    List<FundEntity> findByAdjCloseBetween(double start, double end);
}
