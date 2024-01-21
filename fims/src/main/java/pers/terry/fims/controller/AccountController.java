package pers.terry.fims.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import pers.terry.fims.entity.AccountEntity;
import pers.terry.fims.service.AccountService;

import java.util.Optional;

@RestController
@RequestMapping("/account")
public class AccountController {
    @Autowired
    private AccountService accountService;

    @GetMapping("/{id}")
    public Optional<AccountEntity> getAccountById(@PathVariable(value="id") Integer id){
        System.out.println("id is" + id);
        return this.accountService.getAccountById(id);
    }

    @GetMapping("/new_account/{balance}")
    public AccountEntity createAccount( @PathVariable(value="balance") Integer balance){
        return this.accountService.addAccount(balance);
    }
}
