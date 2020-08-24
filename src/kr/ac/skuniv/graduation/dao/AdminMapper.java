package kr.ac.skuniv.graduation.dao;

import java.util.List;

import kr.ac.skuniv.graduation.dto.Admin;
import kr.ac.skuniv.graduation.mapper.Mapper;

@Mapper
public interface AdminMapper {
	public Admin getAdmin(String admin_id); //ȸ������
	public List<Admin> getAdmins();
	public void addAdmin(Admin admin); //ȸ������
	public void updateAdmin(String admin_id); // ȸ������
	public void deleteAdmin(String admin_id); //ȸ��Ż��
	public Admin idCheck(String admin_id) throws Exception;
}
