package pers.terry.fims.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import pers.terry.fims.entity.FundEntity;
import pers.terry.fims.service.FundService;

import java.util.List;

@RestController
@RequestMapping("/fund")
public class FundController {
    @Autowired
    private FundService fundService;

    @GetMapping("/{start}/{end}")
    public List<FundEntity> getFundBetween(@PathVariable(value = "start") Integer start, @PathVariable(value = "end") Integer end) {
        return this.fundService.getFundInRange(start, end);
    }
}
