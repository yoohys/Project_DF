package org.sweeter.application.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	@Override
	public void configure(WebSecurity web) throws Exception {

	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests()
		.antMatchers("/h2-console/*").hasRole("ADMIN")
		.antMatchers("/admin/**").permitAll()
		.and()
			.formLogin()
				.loginPage("/members/login")
				.defaultSuccessUrl("/")
				.permitAll();
		http.csrf().disable();
		http.headers().frameOptions().disable();
	}
}
