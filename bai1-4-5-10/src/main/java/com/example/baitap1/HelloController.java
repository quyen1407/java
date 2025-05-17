package com.example.baitap1;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/hello")
public class HelloController {

    // GET /todos
    @GetMapping
    public String hello(Model model) {
        model.addAttribute("message", "Hello World");
        return "hello";
    }
}
