package com.tyss.controller;

import java.io.ByteArrayOutputStream;
import org.springframework.http.HttpHeaders;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itextpdf.text.Document;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.tyss.repo.BlogRepository;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
public class AdminController {

	private final BlogRepository blogRepository;
	// registration and login
	
	@GetMapping("/report")
	public String getReport(Model model) {

		List<Object[]> reports =
				blogRepository.getMostActiveUsers();

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

	            return ResponseEntity.ok()
	                    .headers(headers)
	                    .contentType(MediaType.APPLICATION_PDF)
	                    .body(out.toByteArray());

	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return null;
	    }
}
