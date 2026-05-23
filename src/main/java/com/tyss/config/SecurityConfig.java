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
					   .requestMatchers("/user/**").hasRole(Role.USER.name())
					   .requestMatchers("/admin/**").hasRole(Role.ADMIN.name())
					   .anyRequest()
//					   .authenticated()
					   .permitAll()
			)
			.formLogin(l -> l.loginPage("/auth/login")//GET
							 .loginProcessingUrl("/auth/login")//POST
							 .defaultSuccessUrl("/user/dashboard")
							 .failureUrl("/auth/login?error=invalid credentials")
							 .permitAll()
			)
			.logout(l -> l.logoutUrl("/logout"));
		
		return http.build();
	}
	
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
}
