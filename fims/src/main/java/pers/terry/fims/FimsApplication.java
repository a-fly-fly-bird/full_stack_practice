package pers.terry.fims;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@EnableJpaRepositories(basePackages = "pers.terry.fims.repository")
@MapperScan(basePackages = "pers.terry.fims.mapper")
@SpringBootApplication
public class FimsApplication {

	public static void main(String[] args) {
		SpringApplication.run(FimsApplication.class, args);
	}

}
