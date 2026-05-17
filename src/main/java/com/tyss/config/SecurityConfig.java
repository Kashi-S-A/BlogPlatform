package com.tyss.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
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
					   .requestMatchers("/user/**").hasRole(Role.USER.toString())
					   .requestMatchers("/admin/**").hasRole(Role.ADMIN.toString())
					   .anyRequest()
					   .authenticated()
			)
			.formLogin(l -> l.loginPage("/auth/login")//GET
							 .loginProcessingUrl("/login")//POST
							 .successForwardUrl("/dashboard")
							 .failureUrl("/login")
			)
			.logout(l -> l.logoutUrl("/logout"));
		
		return http.build();
	}
	
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
}
