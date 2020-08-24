package kr.ac.skuniv.graduation.dao;

import java.util.List;

import kr.ac.skuniv.graduation.dto.Admin;
import kr.ac.skuniv.graduation.mapper.Mapper;

@Mapper
public interface AdminMapper {
	public Admin getAdmin(String admin_id); //회원정보
	public List<Admin> getAdmins();
	public void addAdmin(Admin admin); //회원가입
	public void updateAdmin(String admin_id); // 회원수정
	public void deleteAdmin(String admin_id); //회원탈퇴
	public Admin idCheck(String admin_id) throws Exception;
}
