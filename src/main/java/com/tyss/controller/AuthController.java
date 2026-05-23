package com.tyss.controller;

import java.util.Optional;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tyss.dto.RegisterDTO;
import com.tyss.entity.User;
import com.tyss.repo.UserRepository;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/auth")
@RequiredArgsConstructor
public class AuthController {

	private final PasswordEncoder passwordEncoder;

	private final UserRepository userRepository;

	// login Page
	@GetMapping("/login")
	public String loginPage(@RequestParam(required = false) String error, Model model) {
		model.addAttribute("err", error);
		return "login";
	}

	// register page
	@GetMapping("/register")
	public String registerPage(Model model) {

		model.addAttribute("register", new RegisterDTO());

		return "register";
	}

	// register
	@PostMapping("/register")
	public String registerUser(Model model, RegisterDTO registerDTO) {

		Optional<User> opt = userRepository.findByEmail(registerDTO.getEmail());

		if (opt.isPresent()) {
			model.addAttribute("err", "Already Register");
			return "login";
		}

		User user = new User();
		user.setEmail(registerDTO.getEmail());
		user.setFullName(registerDTO.getFullName());
		user.setUsername(registerDTO.getUsername());
		user.setPassword(passwordEncoder.encode(registerDTO.getPassword()));

		userRepository.save(user);

		model.addAttribute("succ", "Registered Successfully");

		return "login";
	}

}
