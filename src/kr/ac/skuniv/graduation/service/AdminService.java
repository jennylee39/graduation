package kr.ac.skuniv.graduation.service;

import java.util.List;

import kr.ac.skuniv.graduation.dto.Admin;

public interface AdminService {
	public void regAdmin(Admin admin); //insert
	//public void userDone(String user_id); //update
	public List<Admin> getAdmins(); //select 
	public Admin getAdmin(String admin_id); //select one
	public void deleteAdmin(String admin_id);
	public boolean loginCheck(Admin admin); //로그인 체크
	public Admin viewAdmin(Admin admin); //회원정보보기
	
	public Admin idCheck(String admin_id) throws Exception;
	
}
