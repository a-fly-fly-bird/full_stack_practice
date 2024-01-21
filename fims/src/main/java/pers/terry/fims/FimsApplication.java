package pers.terry.fims;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import springfox.documentation.oas.annotations.EnableOpenApi;

@EnableJpaRepositories(basePackages = "pers.terry.fims.repository")
@SpringBootApplication
public class FimsApplication {

	public static void main(String[] args) {
		SpringApplication.run(FimsApplication.class, args);
	}

}
