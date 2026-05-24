package com.tyss.controller;

import java.security.Principal;
import java.util.Optional;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tyss.dto.BlogPostDTO;
import com.tyss.entity.Blog;
import com.tyss.entity.User;
import com.tyss.repo.BlogRepository;
import com.tyss.repo.UserRepository;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/user")
@RequiredArgsConstructor
public class UserController {

	private final BlogRepository blogRepository;

	private final UserRepository userRepository;

	@GetMapping("/dashboard")
	public String dashboardPage() {
		return "user-dashboard";
	}

	@GetMapping("/search")
	public String Search(Model model, @RequestParam(defaultValue = "0") Integer pageNumber, @RequestParam String s) {

		Pageable pageable = PageRequest.of(pageNumber, 1);

		Page<Blog> page = blogRepository.findByTitleContainingIgnoreCaseOrTagsContainingIgnoreCaseOrAuthorContainingIgnoreCase(s, s, s, pageable);

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
	public String profilePage(Model model, @AuthenticationPrincipal UserDetails userDetails) {
		User user = userRepository.findByEmail(userDetails.getUsername()).get();
		List<Blog> userBlogs = user.getBlogs();

		model.addAttribute("profileUser", user);
		model.addAttribute("profileBlogs", userBlogs);

		return "blog-profile";
	}

	@GetMapping("/blog-post")
	public String blogPostPage(Model model, @RequestParam(required = false) String msg) {

		model.addAttribute("blogpost", new BlogPostDTO());
		model.addAttribute("msg", msg);

		return "blog-posts";
	}

	@PostMapping("/blog-post")
	public String blogPost(Model model, BlogPostDTO blogpostDto, Principal principal) {
		Optional<User> opt = userRepository.findByEmail(principal.getName());

		User user = opt.get();

		Blog blog = new Blog();

		BeanUtils.copyProperties(blogpostDto, blog);

		blog.setUser(user);
		blog.setAuthor(user.getFullName());

		blogRepository.save(blog);

		model.addAttribute("blogAdded", "blog added Successfully");

		return "blog-posts";
	}
	
	@GetMapping("/blog/edit")
	public String blogEditPage(Model model,@RequestParam Integer bid) {
		
		Blog blog = blogRepository.findById(bid).get();
		
		model.addAttribute("blog", blog);
		
		return "blog-edit";
	}
	
	@PostMapping("/blog/edit")
	public String blogEdit(Blog blog) {
		
		Blog dbblog = blogRepository.findById(blog.getId()).get();
		
		dbblog.setTitle(blog.getTitle());
		dbblog.setContent(blog.getContent());
		dbblog.setTags(blog.getTags());
		
		blogRepository.save(dbblog);
		
		return "redirect:/user/profile";
	}
	
	@GetMapping("/blog/delete")
	public String blogDelete(Model model,@RequestParam Integer bid) {
		blogRepository.deleteById(bid);
		return "redirect:/user/profile";
	}
	
	@GetMapping("/logout")
	public String logout() {
		return "login";
	}
	
}
