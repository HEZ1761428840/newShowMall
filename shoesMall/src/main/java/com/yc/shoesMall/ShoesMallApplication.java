package com.yc.shoesMall;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@SpringBootApplication
@Controller
@EnableTransactionManagement
@MapperScan("com.yc")
public class ShoesMallApplication {

	public static void main(String[] args) {
		SpringApplication.run(ShoesMallApplication.class, args);

	}

}
