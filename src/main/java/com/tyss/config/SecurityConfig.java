package com.tyss.config;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

import com.tyss.entity.Role;

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
					   .permitAll()
			)
			.formLogin(l -> l.loginPage("/auth/login")//GET
							 .loginProcessingUrl("/auth/login")//POST
//							 .defaultSuccessUrl("/user/dashboard")

							.successHandler(this::loginSuccessHandler)


							 .failureUrl("/auth/login?error=invalid credentials")
							 .permitAll()
			)
			.logout(l -> l.logoutUrl("/logout"));
		
		return http.build();
	}

	// Custom Success Handler method 
	private void loginSuccessHandler(HttpServletRequest request,
	                                 HttpServletResponse response,
	                                 Authentication authentication) throws java.io.IOException {

		boolean isAdmin = authentication.getAuthorities()
				.stream()
				.anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN"));

		if (isAdmin) {
			response.sendRedirect("/admin/admindashboard");
		} else {
			response.sendRedirect("/user/dashboard");
		}
	}

	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
}
