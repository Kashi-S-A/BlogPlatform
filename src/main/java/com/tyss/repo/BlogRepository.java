package com.tyss.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.tyss.entity.Blog;

public interface BlogRepository extends JpaRepository<Blog, Integer> {

}
