package com.Project.Configuiration;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = {"com.Project.Services","com.Project.Dao"})
public class RootConfig {

	@Bean
	public DriverManagerDataSource dataSource() {
		DriverManagerDataSource dataSource = new org.springframework.jdbc.datasource.DriverManagerDataSource();
		dataSource.setDriverClassName("com.mysql.jdbc.Driver");
		dataSource.setUrl("jdbc:mysql://10.173.45.186:3306/mydemodb");
		dataSource.setUsername("root");
		dataSource.setPassword("root123");
		return dataSource;
	}
	@Bean
	public JdbcTemplate jt() {
		JdbcTemplate jt = new org.springframework.jdbc.core.JdbcTemplate();		
		jt.setDataSource(dataSource());
		return jt;
	}
}
