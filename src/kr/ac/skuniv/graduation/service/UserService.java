package kr.ac.skuniv.graduation.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import kr.ac.skuniv.graduation.dto.User;

public interface UserService {
	public User regUser(User user); //insert
	//public void userDone(String user_id); //update
	public List<User> getUsers(); //select 
	public User getUser(String user_id); //select one
	public void deleteUser(String user_id);
	public boolean loginCheck(User user); //로그인 체크
	public User viewUser(User user); //회원정보보기
	
	public User idCheck(String user_id) throws Exception;
	public void logout(HttpServletResponse response) throws Exception;
}
