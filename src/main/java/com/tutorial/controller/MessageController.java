package com.tutorial.controller;

import com.tutorial.entity.Message;
import com.tutorial.entity.User;
import com.tutorial.repository.MessageRepository;
import com.tutorial.specification.MessageSpecification;

import org.springframework.data.jpa.domain.Specification;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/message")
public class MessageController {
  private final MessageRepository messageRepository;

  public MessageController(MessageRepository messageRepository) {
    this.messageRepository = messageRepository;
  }

  @GetMapping
  public String index(
      @RequestParam(name = "tag", required = false, defaultValue = "") String tag,
      Model model
  ) {
    Specification<Message> messageSpecification = new MessageSpecification(tag);

    model.addAttribute("tag", tag);
    model.addAttribute("messages", messageRepository.findAll(messageSpecification));

    return "message/index";
  }

  @PostMapping
  public String create(
      @AuthenticationPrincipal User user,
      Message message
  ) {
    message.setAuthor(user);

    messageRepository.save(message);

    return "redirect:/message";
  }
}
