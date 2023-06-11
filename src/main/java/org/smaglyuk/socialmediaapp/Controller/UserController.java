package org.smaglyuk.socialmediaapp.Controller;

import org.smaglyuk.socialmediaapp.Service.UserService;
import org.smaglyuk.socialmediaapp.domain.Role;
import org.smaglyuk.socialmediaapp.domain.User;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/user")
@PreAuthorize("hasAuthority('ADMIN')")
public class UserController {
    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping
    public String userList(Model model) {
        model.addAttribute("users", userService.getAllUsers());
        return "userList";
    }

    @GetMapping("{user}")
    public String userEditForm(@PathVariable User user, Model model) {
        model.addAttribute("user", user);
        model.addAttribute("roles", Role.values());
        return "userEdit";
    }

    @PostMapping
    public String userUpdate(
            @RequestParam String username,
            @RequestParam("userId") User user,
            @RequestParam Map<String, String> form) {
        userService.updateUser(username, user, form);
        return "redirect:/user";
    }
}
