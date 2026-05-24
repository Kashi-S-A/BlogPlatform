package com.tyss.controller;

import com.itextpdf.text.Font;
import java.io.ByteArrayOutputStream;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.tyss.entity.Blog;
import com.tyss.entity.User;
import com.tyss.repo.BlogRepository;
import com.tyss.repo.UserRepository;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
public class AdminController {
	
	private final BlogRepository blogRepository;
	
	private final UserRepository userRepository;

	@GetMapping("/dashboard")
	public String adminDashboard(Model model,@RequestParam(required = false) String msg) {
		List<Blog> all = blogRepository.findAll();
		model.addAttribute("blogs", all);
		model.addAttribute("msg",msg);
		return "admin-dashboard";
	}

	@GetMapping("/deleteblog/{id}")
	public String deletePost(@PathVariable Integer id) {
		System.out.println("Id is: " + id);
		blogRepository.deleteById(id);
		return "redirect:/admin/dashboard";
	}

	@GetMapping("/editblog/{id}")
	public String editBlog(@PathVariable Integer id, Model model) {
		Optional<Blog> byId = blogRepository.findById(id);
		if (byId.isEmpty()) {
			throw new RuntimeException("Blog not found !");
		}
		Blog blog = byId.get();
		model.addAttribute("blog", blog);
		return "edit-blog";
	}

	@PostMapping("/update-blog")
	public String updateBlog(Blog blog) {
		
		Blog dbBlog = blogRepository.findById(blog.getId()).get();
		dbBlog.setAuthor(blog.getAuthor());
		dbBlog.setContent(blog.getContent());
		dbBlog.setTags(blog.getTags());
		dbBlog.setTitle(blog.getTitle());
		
		blogRepository.save(dbBlog);
		
		return "redirect:/admin/dashboard?msg=Blog updated successfully...!";
	}

	/*
	 * @GetMapping("/dashboard") public String dashoardPage() {
	 * 
	 * return "admin-dashboard"; }
	 */
	// manage users page by hritik
	@GetMapping("/users")
	public String manageUsers(Model model, Principal principal) {

		User user = userRepository.findByEmail(principal.getName()).get();

		List<User> users = userRepository.findAll();
		users.remove(user);

		model.addAttribute("users", users);

		return "users";
	}

	// delete user
	@GetMapping("/delete-user/{id}")
	public String deleteUser(@PathVariable Integer id) {

		userRepository.deleteById(id);

		return "redirect:/admin/users";
	}

	// registration and login

	@GetMapping("/report")
	public String getReport(Model model) {

		List<Object[]> reports = blogRepository.getMostActiveUsers();

		model.addAttribute("reports", reports);

		return "reports";
	}

	// to generate pdf
	@GetMapping("/download-report")
	public ResponseEntity<byte[]> downloadReport() {

	    try {

	        // Fetch data from DB
	        List<Object[]> reportData = blogRepository.getMostActiveUsers();

	        // Store data into Map
	        Map<String, Integer> usersBlog = new HashMap<>();

	        for (Object[] obj : reportData) {

	            String userName = (String) obj[0];

	            // COUNT() returns Long in JPA
	            Long count = (Long) obj[1];

	            usersBlog.put(userName, count.intValue());
	        }

	        // PDF Creation
	        ByteArrayOutputStream out = new ByteArrayOutputStream();

	        Document document = new Document();

	        PdfWriter.getInstance(document, out);

	        document.open();

	        // Title
	        Font titleFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 18);

	        Paragraph title = new Paragraph("Most Active Users Report", titleFont);

	        title.setAlignment(Element.ALIGN_CENTER);

	        document.add(title);

	        document.add(new Paragraph(" "));

	        // Table
	        PdfPTable table = new PdfPTable(2);

	        table.setWidthPercentage(100);

	        table.setSpacingBefore(10f);

	        // Header Cells
	        PdfPCell h1 = new PdfPCell(new Phrase("User Name"));
	        PdfPCell h2 = new PdfPCell(new Phrase("No Of Blogs"));

	        table.addCell(h1);
	        table.addCell(h2);

	        // Data Rows
	        for (Map.Entry<String, Integer> entry : usersBlog.entrySet()) {

	            table.addCell(entry.getKey());

	            table.addCell(String.valueOf(entry.getValue()));
	        }

	        document.add(table);

	        document.close();

	        // Response Header
	        HttpHeaders headers = new HttpHeaders();

	        headers.add("Content-Disposition", "attachment; filename=report.pdf");

	        return ResponseEntity
	                .ok()
	                .headers(headers)
	                .contentType(MediaType.APPLICATION_PDF)
	                .body(out.toByteArray());

	    } catch (Exception e) {

	        e.printStackTrace();
	    }

	    return ResponseEntity.internalServerError().build();
	}

	// Jignesh

	@GetMapping("/post-module")
	public String openPostModerationPage(@RequestParam(defaultValue = "0") Integer page, Model model) {

		Pageable pageable = PageRequest.of(page, 1);

		Page<Blog> blogPage = blogRepository.findByStatusOrderByCreatedDateDesc("PENDING", pageable);

		model.addAttribute("page", blogPage);

		return "post-mod";
	}

	@PostMapping("/blog/approve")
	public String approveBlog(@RequestParam Integer id, @RequestParam(defaultValue = "0") Integer page, Model model) {

		Optional<Blog> optionalBlog = blogRepository.findById(id);

		if (optionalBlog.isPresent()) {
			Blog blog = optionalBlog.get();

			blog.setStatus("APPROVED");

			blogRepository.save(blog);
		}

		Pageable pageable = PageRequest.of(page, 1);

		Page<Blog> blogPage = blogRepository.findByStatusOrderByCreatedDateDesc("PENDING", pageable);

		if (!blogPage.hasContent() && page > 0) {
			page = page - 1;
			pageable = PageRequest.of(page, 1);
			blogPage = blogRepository.findByStatusOrderByCreatedDateDesc("PENDING", pageable);
		}

		model.addAttribute("page", blogPage);
		model.addAttribute("successMsg", "Blog approved successfully.");

		return "post-mod";
	}

	@PostMapping("/blog/reject")
	public String rejectBlog(@RequestParam Integer id, @RequestParam(defaultValue = "0") Integer page,
			@RequestParam(required = false) String adminNote, Model model) {

		Optional<Blog> optionalBlog = blogRepository.findById(id);

		if (optionalBlog.isPresent()) {
			Blog blog = optionalBlog.get();

			blog.setStatus("REJECTED");

			blogRepository.save(blog);
		}

		Pageable pageable = PageRequest.of(page, 1);

		Page<Blog> blogPage = blogRepository.findByStatusOrderByCreatedDateDesc("PENDING", pageable);

		if (!blogPage.hasContent() && page > 0) {
			page = page - 1;
			pageable = PageRequest.of(page, 1);
			blogPage = blogRepository.findByStatusOrderByCreatedDateDesc("PENDING", pageable);
		}

		model.addAttribute("page", blogPage);
		model.addAttribute("successMsg", "Blog rejected successfully.");

		return "post-mod";
	}

	@PostMapping("/blog/remove")
	public String removeBlog(@RequestParam("id") Integer id, @RequestParam(defaultValue = "0") Integer page,
			@RequestParam(value = "adminNote", required = false) String adminNote, Model model) {

		Optional<Blog> optionalBlog = blogRepository.findById(id);

		if (optionalBlog.isPresent()) {
			Blog blog = optionalBlog.get();

			blog.setStatus("REMOVED");

			blogRepository.save(blog);
		}

		Pageable pageable = PageRequest.of(page, 1);

		Page<Blog> blogPage = blogRepository.findByStatusOrderByCreatedDateDesc("PENDING", pageable);

		if (!blogPage.hasContent() && page > 0) {
			page = page - 1;
			pageable = PageRequest.of(page, 1);
			blogPage = blogRepository.findByStatusOrderByCreatedDateDesc("PENDING", pageable);
		}

		model.addAttribute("page", blogPage);
		model.addAttribute("successMsg", "Blog removed successfully.");

		return "post-mod";
	}

	@GetMapping("/logout")
	public String logout() {
		return "login";
	}

}
