package com.example.baitap1;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class WelcomeModel {
    private String message;
    private String currentTime;

    public WelcomeModel() {
        this.message = "Chào mừng bạn đến với ứng dụng Spring Boot!";
        this.currentTime = LocalDateTime.now().format(DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss"));
    }

    public String getMessage() {
        return message;
    }

    public String getCurrentTime() {
        return currentTime;
    }
}
