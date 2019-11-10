package com.tutorial.controller;

import com.tutorial.entity.User;
import com.tutorial.entity.UserRole;
import com.tutorial.repository.UserRepository;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Collections;

@Controller
@RequestMapping("/registration")
public class RegistrationController {
  private final UserRepository userRepository;

  public RegistrationController(UserRepository userRepository) {
    this.userRepository = userRepository;
  }

  @GetMapping
  public String index() {
    return "security/registration";
  }

  @PostMapping
  public String create(
      User user,
      Model model
  ) {
    User userFromDb = userRepository.findByLogin(user.getLogin());

    if (userFromDb != null) {
      model.addAttribute("message", "Пользователь с таким логином существует");

      return "security/registration";
    }

    user.setActive(true);
    user.setRoles(Collections.singleton(UserRole.USER));

    userRepository.save(user);

    return "redirect:/login";
  }
}
