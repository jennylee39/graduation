package kr.ac.skuniv.graduation.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.ac.skuniv.graduation.config.ApplicationConfig;
import kr.ac.skuniv.graduation.dto.User;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes=ApplicationConfig.class)

public class UserServiceTest {
	@Autowired
	UserService userService;
	
	
	/*  @Test 
	  public void addUser() { 
		 User user = new User();
	  user.setId("zzqq"); 
	  user.setPassword("1212"); 
	  user.setName("이주은");
	  user.setEmail1("je309"); 
	  user.setEmail2("skuniv.ac.kr");
	  user.setRoom("1005"); 
	  user.setJob("대학생-재학"); 
	  user.setSchool("서경대학교");
	  user.setDept("컴퓨터과학과"); 
	  user.setPhoneNum("010987456");
	  user.setAddress("서울특별시");
	  */
	  //System.out.println(user+"---");
	/*
	 * System.out.println(userService.regUser(user)+"+++");
	 * 
	 * }
	 */
	
	/*
	 * @Test public void deleteUser() {
	 * 
	 * 
	 * userService.deleteUser("  ");
	 * 
	 * System.out.println("---"); }
	 */

	/*
	 * @Test public void getUser() throws Exception {
	 * System.out.println(userService.getUser("wndms0335").toString()); }
	 */
}
