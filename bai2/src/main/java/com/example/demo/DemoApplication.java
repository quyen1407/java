package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class DemoApplication extends SpringBootServletInitializer {

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
		// Cho phép deploy WAR vào container ngoài
		return builder.sources(DemoApplication.class);
	}

	public static void main(String[] args) {
		// Vẫn chạy bình thường với embedded Tomcat
		SpringApplication.run(DemoApplication.class, args);
	}
}
