package com.tyss.controller;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tyss.entity.Blog;
import com.tyss.repo.BlogRepository;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/user")
@RequiredArgsConstructor
public class UserController {

	private final BlogRepository blogRepository;

	@GetMapping("/dashboard")
	public String dashboardPage() {
		return "user-dashboard";
	}

	@GetMapping("/search")
	public String Search(Model model, @RequestParam(defaultValue = "0") Integer pageNumber, @RequestParam String s) {

		Pageable pageable = PageRequest.of(pageNumber, 1);

		Page<Blog> page = blogRepository.findByTitleOrTagsOrAuthorContainingAllIgnoreCase(s, s, s, pageable);

		model.addAttribute("page", page);

		return "blog-home";
	}

	@GetMapping("/home")
	public String homePage(Model model, @RequestParam(defaultValue = "0") Integer pageNumber,
			@RequestParam(required = false, defaultValue = "createdDate") String by) {

		Pageable pageable = null;

		if (by.equals("createdDate")) {
			pageable = PageRequest.of(pageNumber, 1, Sort.by(by).descending());
		} else {
			pageable = PageRequest.of(pageNumber, 1, Sort.by(by).ascending());
		}

		Page<Blog> page = blogRepository.findAll(pageable);

		model.addAttribute("page", page);
		model.addAttribute("by", by);

		return "blog-home";
	}

	@GetMapping("/profile")
	public String profilePage() {
		return "blog-profile";
	}

	@GetMapping("/blog-post")
	public String blogPostPage() {
		return "blog-posts";
	}
}
