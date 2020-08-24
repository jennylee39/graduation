package kr.ac.skuniv.graduation.dao;

import java.util.List;

import kr.ac.skuniv.graduation.dto.User;
import kr.ac.skuniv.graduation.mapper.Mapper;
@Mapper
public interface UserMapper {
	public User getUser(String user_id); //회원정보
	public List<User> getUsers();
	public void addUser(User user); //회원가입
	public void updateUser(String user_id); // 회원수정
	public void deleteUser(String user_id); //회원탈퇴
	public User idCheck(String user_id) throws Exception;
	public void logout(javax.servlet.http.HttpServletResponse response) throws Exception;
}
