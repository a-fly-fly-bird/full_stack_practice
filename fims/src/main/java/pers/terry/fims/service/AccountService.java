package pers.terry.fims.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pers.terry.fims.entity.AccountEntity;
import pers.terry.fims.repository.AccountRepository;

import java.util.Optional;

@Service
public class AccountService {
    @Autowired
    private AccountRepository accountRepository;

    public AccountEntity addAccount(Integer balance){
        AccountEntity accountEntity = new AccountEntity();
        accountEntity.setBalance(balance);
        return this.accountRepository.save(accountEntity);
    }

    public Optional<AccountEntity> getAccountById(Integer id){
        return this.accountRepository.findById(id);
    }
}
