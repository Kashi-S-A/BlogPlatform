package com.tyss.controller;

import java.io.ByteArrayOutputStream;
import java.util.List;
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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itextpdf.text.Document;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.tyss.entity.Blog;
import com.tyss.repo.BlogRepository;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
public class AdminController {

	private final BlogRepository blogRepository;

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

			ByteArrayOutputStream out = new ByteArrayOutputStream();

			Document document = new Document();

			PdfWriter.getInstance(document, out);

			document.open();

			document.add(new Paragraph("Most Active Users Report"));
			document.add(new Paragraph(" "));

			PdfPTable table = new PdfPTable(2);

			table.addCell("User Name");
			table.addCell("No Of Blogs");

			table.addCell("Amit");
			table.addCell("6");

			table.addCell("Akash");
			table.addCell("4");

			table.addCell("Pramod");
			table.addCell("5");

			document.add(table);

			document.close();

			HttpHeaders headers = new HttpHeaders();

			headers.add("Content-Disposition", "attachment; filename=report.pdf");

			return ResponseEntity.ok().headers(headers).contentType(MediaType.APPLICATION_PDF).body(out.toByteArray());

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
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
	public String approveBlog(@RequestParam("id") Integer id, @RequestParam(defaultValue = "0") Integer page,
			Model model) {

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
	public String rejectBlog(@RequestParam("id") Integer id, @RequestParam(defaultValue = "0") Integer page,
			@RequestParam(value = "adminNote", required = false) String adminNote, Model model) {

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

}
