<<<<<<< HEAD
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
        return "hello";  // maps to hello.jsp
    }
}
=======
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
        return "hello";  // maps to hello.jsp
    }
}
>>>>>>> c1a7eadd847e97804b6c13bd626d3595b976ce9a
