package com.example.baitap1.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // Khai báo URL "/uploads/images/**" sẽ trỏ đến thư mục ảnh trong user.home/uploads/images/
        registry
                .addResourceHandler("/uploads/images/**")
                .addResourceLocations("file:" + System.getProperty("user.home") + "/uploads/images/");
    }
}
