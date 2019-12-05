package org.sweeter.application;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan(value = { "org.sweeter.application.model.mapper" })
public class SweeterApplication {

	public static void main(String[] args) {
		SpringApplication.run(SweeterApplication.class, args);
	}

}
