package pers.terry.fims.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pers.terry.fims.entity.FundEntity;
import pers.terry.fims.repository.FundRepository;

import java.util.List;

@Service
public class FundService {
    @Autowired
    private FundRepository fundRepository;

    public List<FundEntity> getFundInRange(double start, double end){
        return this.fundRepository.findByAdjCloseBetween(start, end);
    }
}
