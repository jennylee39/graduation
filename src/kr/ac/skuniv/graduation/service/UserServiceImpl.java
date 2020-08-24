package kr.ac.skuniv.graduation.service;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import kr.ac.skuniv.graduation.dao.UserMapper;
import kr.ac.skuniv.graduation.dto.User;

@Service
@Repository
public class UserServiceImpl implements UserService {

	@Autowired
	UserMapper userDao;
	
	private SqlSession sqlSession;

	  public void setSqlSession(SqlSession sqlSession) {
	    this.sqlSession = sqlSession;
	  }
	
	@Override
	public User regUser(User user) {
		userDao.addUser(user);
		
		return user;
	}
	
	@Override
	public User idCheck(String user_id) throws Exception {
		
		
		
		return userDao.idCheck(user_id);
	}


	@Override
	public User getUser(String user_id) {
		
		return userDao.getUser(user_id);
	}

	
	  @Override 
	  public void deleteUser(String user_id) {
	  
	  }


	@Override
	public boolean loginCheck(User user) {
		//user : 입력값
		//dbUser :  db에 있는 사용자 값

		User dbUser = userDao.getUser(user.getUser_id());
		if(dbUser!=null) {
			if(dbUser.getUser_pwd().contentEquals(user.getUser_pwd()))
				
				return true;
			else {
				
				return false;
			}
		}else {
	
			return false;
			
		}
		
	}


	@Override
	public User viewUser(User user) {
		
		return sqlSession.selectOne("user.viewUser", user);
	}

	@Override
	public List<User> getUsers() {
		
		return userDao.getUsers();
	}

	@Override
	public void logout(HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("location.href=document.referrer;");
		out.println("</script>");
		out.close();
	}



	 
}
