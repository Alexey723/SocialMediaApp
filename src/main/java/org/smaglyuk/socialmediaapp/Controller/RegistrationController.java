package org.smaglyuk.socialmediaapp.Controller;

import org.smaglyuk.socialmediaapp.Service.UserService;
import org.smaglyuk.socialmediaapp.domain.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.Map;

@Controller
public class RegistrationController {
    private final UserService userService;

    public RegistrationController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/registration")
    public String registration(){
        return "registration";
    }
    @PostMapping("/registration")
    public String addUser(User user, Map<String, Object> model){
        if(userService.getUsername(user)!= null){
            model.put("message", "User exists");
            return "registration";
        }
        userService.register(user);
        return "redirect:/login";
    }
}
