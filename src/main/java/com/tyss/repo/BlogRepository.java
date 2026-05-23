package com.tyss.repo;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.tyss.entity.Blog;

public interface BlogRepository extends JpaRepository<Blog, Integer> {

	Page<Blog> findByTitleOrTagsOrAuthorContainingAllIgnoreCase(String author, String title, String tags,
			Pageable pageable);
	
	@Query("""
			SELECT b.user.username , COUNT(b)
			FROM Blog b
			GROUP BY b.user.username
			""")
	List<Object[]> getMostActiveUsers();
}
