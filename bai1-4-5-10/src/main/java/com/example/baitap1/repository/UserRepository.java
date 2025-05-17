package com.example.baitap1.repository;
// truy vấn thao tác vào cở dữ liệu

import com.example.baitap1.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {
    boolean existsByUsername(String username);
}
