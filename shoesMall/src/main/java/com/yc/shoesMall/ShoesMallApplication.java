package com.yc.shoesMall;


import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.yc.shoesMall.web.LoginInterceptor;

import org.springframework.transaction.annotation.EnableTransactionManagement;

@SpringBootApplication
@Controller
@EnableTransactionManagement
@MapperScan("com.yc")
public class ShoesMallApplication implements WebMvcConfigurer{

	public static void main(String[] args) {
		SpringApplication.run(ShoesMallApplication.class, args);

	}
	
	/**
	 * 注册拦截器， 当容器启动时， 该方法会被调用，那么注册拦截器就会被加载导容器中
	 */
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		
		registry.addInterceptor(new LoginInterceptor())
		.addPathPatterns("/toedit");
		
	}

}
