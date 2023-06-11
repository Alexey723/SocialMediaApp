package org.smaglyuk.socialmediaapp.Service;

import org.smaglyuk.socialmediaapp.domain.Role;
import org.smaglyuk.socialmediaapp.domain.User;
import org.smaglyuk.socialmediaapp.repository.UserRepository;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.ObjectUtils;

import java.util.*;
import java.util.stream.Collectors;

@Service
public class UserService implements UserDetailsService{
    private final UserRepository userRepository;

    private final DefaultEmailService mailSender;

    public UserService(UserRepository userRepository, DefaultEmailService mailSender) {
        this.userRepository = userRepository;
        this.mailSender = mailSender;
    }

    public User getUsername(User user) {
        User person_db = userRepository.findByUsername(user.getUsername());
        return person_db;
    }

    public List<User> getAllUsers() {
        return userRepository.findAll();
    }

    @Transactional
    public boolean register(User user) {
        if(getUsername(user)!= null){
            return false;
        }
        user.setActive(true);
        user.setRoles(Collections.singleton(Role.USER));
        user.setActivationCode(UUID.randomUUID().toString());
        userRepository.save(user);

        if(!ObjectUtils.isEmpty(user.getEmail())){
            String message = String.format(
                    "Hello, %s!\n" +
                            "Welcome to Social Media App! Please, visit next link: http://localhost:8080/activate/%s",
                    user.getUsername(),
                    user.getActivationCode());
            mailSender.send(user.getEmail(), "Activation code", message);
        }

        return true;
    }

    @Transactional
    public void updateUser(String username, User user, Map<String, String> form) {
        user.setUsername(username);

        Set<String> roles = Arrays.stream(Role.values())
                .map(Role::name)
                .collect(Collectors.toSet());

        user.getRoles().clear();

        for (String key : form.keySet()) {
            if (roles.contains(key)) {
                user.getRoles().add(Role.valueOf(key));
            }
        }
        userRepository.save(user);
    }


    @Override
    public UserDetails loadUserByUsername(String name) throws UsernameNotFoundException {
        return userRepository.findByUsername(name);
    }

    @Transactional
    public boolean activateUser(String code) {
        User user = userRepository.findByActivationCode(code);
        if(user == null){
            return false;
        }
        user.setActivationCode(null);
        userRepository.save(user);
        return true;
    }
}
