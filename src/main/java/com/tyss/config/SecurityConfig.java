package com.tyss.config;

import java.io.IOException;
import java.util.Collection;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

import com.tyss.entity.Role;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

	@Bean
	public SecurityFilterChain filterChain(HttpSecurity http) {

		http.csrf(c -> c.disable())
				.authorizeHttpRequests(req -> 
					req.requestMatchers("/auth/**").permitAll()
					   .requestMatchers("/user/**").hasRole(Role.USER.name())
					   .requestMatchers("/admin/**").hasRole(Role.ADMIN.name())
					   .anyRequest()
//					   .authenticated()
					   .permitAll())
				.formLogin(l -> l.loginPage("/auth/login")// GET
						.loginProcessingUrl("/auth/login")// POST
						.successHandler(this::loginSuccessHandler)
						.failureUrl("/auth/login?error=invalid credentials")
						.permitAll())
				.logout(l -> l.logoutUrl("/logout"));

		return http.build();
	}

	private void loginSuccessHandler(HttpServletRequest request, HttpServletResponse response,
			org.springframework.security.core.Authentication authentication) throws IOException, ServletException {

		Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();

		for (GrantedAuthority authority : authorities) {

			if (authority.getAuthority().equals("ROLE_ADMIN")) {
				response.sendRedirect("/admin/dashboard");
				return;
			}

			if (authority.getAuthority().equals("ROLE_USER")) {
				response.sendRedirect("/user/dashboard");
				return;
			}
		}

		response.sendRedirect("/auth/login");
	}

	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
}
