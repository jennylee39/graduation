package kr.ac.skuniv.graduation.service;

import java.util.List;

import kr.ac.skuniv.graduation.dto.Admin;

public interface AdminService {
	public void regAdmin(Admin admin); //insert
	//public void userDone(String user_id); //update
	public List<Admin> getAdmins(); //select 
	public Admin getAdmin(String admin_id); //select one
	public void deleteAdmin(String admin_id);
	public boolean loginCheck(Admin admin); //�α��� üũ
	public Admin viewAdmin(Admin admin); //ȸ����������
	
	public Admin idCheck(String admin_id) throws Exception;
	
}
