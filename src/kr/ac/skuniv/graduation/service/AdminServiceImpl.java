package kr.ac.skuniv.graduation.service;

import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import kr.ac.skuniv.graduation.dao.AdminMapper;
import kr.ac.skuniv.graduation.dto.Admin;

@Service
@Repository
public class AdminServiceImpl implements AdminService {

	@Autowired
	AdminMapper adminDao;
	
	private SqlSession sqlSession;

	  public void setSqlSession(SqlSession sqlSession) {
	    this.sqlSession = sqlSession;
	  }
	
	@Override
	public void regAdmin(Admin admin) {
		adminDao.addAdmin(admin);
		
	}
	
	@Override
	public Admin idCheck(String admin_id) throws Exception {

		return adminDao.idCheck(admin_id);
	}


	@Override
	public Admin getAdmin(String admin_id) {
		
		return adminDao.getAdmin(admin_id);
	}

	
	  @Override 
	  public void deleteAdmin(String admin_id) {
	  
	  }


	@Override
	public boolean loginCheck(Admin admin) {
		//user : 입력값
		//dbUser :  db에 있는 사용자 값

		Admin dbAdmin = adminDao.getAdmin(admin.getAdmin_id());
		if(dbAdmin!=null) {
			if(dbAdmin.getAdmin_pwd().contentEquals(admin.getAdmin_pwd()))
				
				return true;
			else {
				
				return false;
			}
		}else {
	
			return false;
			
		}
		
	}


	@Override
	public Admin viewAdmin(Admin admin) {
		
		return sqlSession.selectOne("admin.viewAdmin", admin);
	}

	@Override
	public List<Admin> getAdmins() {
		
		return adminDao.getAdmins();
	}




	 
}
