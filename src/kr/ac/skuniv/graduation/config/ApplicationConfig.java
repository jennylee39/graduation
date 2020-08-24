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


//service�� dao�� �ڵ����� bean �������! --> �̰��� �и��ؼ� �� ����ϴ� ������.
@Configuration
@ComponentScan(basePackages= {"kr.ac.skuniv.graduation.service","kr.ac.skuniv.graduation.dao"})
@Import({MybatisConfig.class})
//transaction ����
@EnableTransactionManagement
public class ApplicationConfig {
	
	//���� ����ϴ� ���� : ��ü������ ������ �����̳ʰ� �ڵ����� ����� ���ֱ� ���ؼ�
	@Bean
	// datasource : ���� ������ ������ �������ִ� ��ü
	// -> db ���������� �츮�� �˷������
	// datasource�� mybatis�� �������� ���� �ƴ϶� �ٸ� �����ӿ�ũ������ �� �� �ִ�.
	public DataSource dataSource() {
		SimpleDriverDataSource dataSource = new SimpleDriverDataSource();
		// mysql driver�� import�ؼ� �� ����. 
		dataSource.setDriverClass(Driver.class);
		dataSource.setUrl("jdbc:mysql://localhost:3306/dorm?characterEncoding=utf8&serverTimezone=UTC");
		dataSource.setUsername("root");
		dataSource.setPassword("1234");		
		return dataSource;
	}
	
	// transaction ����
	@Bean
	public PlatformTransactionManager transactionManager() {
		return new DataSourceTransactionManager(dataSource());
	}
	
	@Bean
	//JdbcTemplate : ���Ǹ��� ������ ���ϰ� ����
	public JdbcTemplate jdbcTemplate() {
		return new JdbcTemplate(dataSource());
	}
	
	
}