package org.smaglyuk.socialmediaapp.Service;

import org.smaglyuk.socialmediaapp.domain.Role;
import org.smaglyuk.socialmediaapp.domain.User;
import org.smaglyuk.socialmediaapp.repository.UserRepository;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collections;
import java.util.Optional;

@Service
public class UserService implements UserDetailsService {
    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }
    public User getUsername(User user){
        User person_db = userRepository.findByUsername(user.getUsername());
        return person_db;
    }
    @Transactional
    public void register(User user){
        user.setActive(true);
        user.setRole(Collections.singleton(Role.USER));
        userRepository.save(user);
    }

    @Override
    public UserDetails loadUserByUsername(String name) throws UsernameNotFoundException {
        return userRepository.findByUsername(name);
    }
}
