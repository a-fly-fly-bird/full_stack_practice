package pers.terry.fims;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;
import springfox.documentation.oas.annotations.EnableOpenApi;

@EnableJpaAuditing
@EnableOpenApi
@SpringBootApplication
public class FimsApplication {

	public static void main(String[] args) {
		SpringApplication.run(FimsApplication.class, args);
	}

}
