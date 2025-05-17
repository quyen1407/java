package com.example.baitap1;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/welcome")
public class WelcomeController {

    @GetMapping
    public String showWelcomePage(Model model) {
        WelcomeModel welcomeModel = new WelcomeModel();
        model.addAttribute("welcome", welcomeModel);
        return "welcome";
    }
}