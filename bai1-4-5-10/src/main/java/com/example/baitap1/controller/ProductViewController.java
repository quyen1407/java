package com.example.baitap1.controller;

import com.example.baitap1.entity.Product;
import com.example.baitap1.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import java.util.List;

@Controller
@RequestMapping("/products")
public class ProductViewController {

    @Autowired
    private ProductRepository productRepository;

    @GetMapping
    public String showProductPage(Model model) {
        try {
            List<Product> products = productRepository.findAll();
            model.addAttribute("products", products);
        } catch (Exception e) {
            model.addAttribute("products", List.of());
            System.err.println("Error loading products: " + e.getMessage());
        }
        return "products";
    }
}
