package com.example.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	private UserPrincipalDetailsService userPrincipalUserDetailsService;
	
    @Override
    protected void configure(final AuthenticationManagerBuilder auth) throws Exception {
    	auth.authenticationProvider(authenticationProvider());
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
    	http
    		.authorizeRequests()
    		.antMatchers("/admin/**").hasRole("ADMIN")
    		.antMatchers("/user/**").hasRole("USER")
    		.anyRequest().permitAll()
  		  	.and()
  		  	.formLogin().loginProcessingUrl("/login").loginPage("/login")
  		  	.usernameParameter("name").passwordParameter("pass")
  		  	.successHandler(myAuthenticationSuccessHandler())
    		.and()
    		.logout().logoutSuccessUrl("/login?logout")
    		.and()
    		.exceptionHandling().accessDeniedPage("/403")
    		.and()
    		.csrf().disable();
    	
    }

    @Bean
    public AuthenticationSuccessHandler myAuthenticationSuccessHandler(){	
        return new MySimpleUrlAuthenticationSuccessHandler();
    }
    
    @Bean
    DaoAuthenticationProvider authenticationProvider() {
    	DaoAuthenticationProvider daoAuthenticationProvider = new DaoAuthenticationProvider();
    	daoAuthenticationProvider.setPasswordEncoder(passwordEncoder());
    	daoAuthenticationProvider.setUserDetailsService(this.userPrincipalUserDetailsService);
    	return daoAuthenticationProvider;
    }
    
    @Bean
    PasswordEncoder passwordEncoder() {
    	return new BCryptPasswordEncoder();
    }
}
