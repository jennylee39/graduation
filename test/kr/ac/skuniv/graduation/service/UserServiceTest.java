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
	  user.setName("������");
	  user.setEmail1("je309"); 
	  user.setEmail2("skuniv.ac.kr");
	  user.setRoom("1005"); 
	  user.setJob("���л�-����"); 
	  user.setSchool("������б�");
	  user.setDept("��ǻ�Ͱ��а�"); 
	  user.setPhoneNum("010987456");
	  user.setAddress("����Ư����");
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
