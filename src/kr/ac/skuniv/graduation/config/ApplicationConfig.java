package kr.ac.skuniv.graduation.config;

import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.jdbc.datasource.SimpleDriverDataSource;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.mysql.cj.jdbc.Driver;


//service와 dao를 자동으로 bean 등록해줘! --> 이것이 분리해서 빈 등록하는 것이지.
@Configuration
@ComponentScan(basePackages= {"kr.ac.skuniv.graduation.service","kr.ac.skuniv.graduation.dao"})
@Import({MybatisConfig.class})
//transaction 설정
@EnableTransactionManagement
public class ApplicationConfig {
	
	//빈을 등록하는 이유 : 객체생성을 스프링 컨테이너가 자동으로 만들게 해주기 위해서
	@Bean
	// datasource : 실제 디비와의 연결을 관리해주는 객체
	// -> db 접속정보를 우리가 알려줘야해
	// datasource는 mybatis에 종속적인 것이 아니라서 다른 프레임워크에서도 쓸 수 있다.
	public DataSource dataSource() {
		SimpleDriverDataSource dataSource = new SimpleDriverDataSource();
		// mysql driver를 import해서 쓴 것임. 
		dataSource.setDriverClass(Driver.class);
		dataSource.setUrl("jdbc:mysql://localhost:3306/dorm?characterEncoding=utf8&serverTimezone=UTC");
		dataSource.setUsername("root");
		dataSource.setPassword("1234");		
		return dataSource;
	}
	
	// transaction 설정
	@Bean
	public PlatformTransactionManager transactionManager() {
		return new DataSourceTransactionManager(dataSource());
	}
	
	@Bean
	//JdbcTemplate : 스피링과 접속을 편하게 해줌
	public JdbcTemplate jdbcTemplate() {
		return new JdbcTemplate(dataSource());
	}
	
	
}