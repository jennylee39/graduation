package kr.ac.skuniv.graduation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.skuniv.graduation.dao.DormMapper;
import kr.ac.skuniv.graduation.dto.Dorm;
import kr.ac.skuniv.graduation.dto.DormPaging;

@Service

public class DormServiceImpl implements DormService {

	@Autowired
	DormMapper dormDao;
	
	@Override
	public Dorm regDorm(Dorm dorm) {
		dormDao.addDorm(dorm);
		return dorm;
	}

	@Override
	public List<Dorm> getDorms(DormPaging pagination) {
		return dormDao.getDorms(pagination);
	}
	@Override
	public int getDormListCnt() {
		return dormDao.getDormListCnt();
	}
	  @Override 
	  public Dorm viewDetail(int dormBno) { 
		  return  dormDao.viewDetail(dormBno); }
	  
	  @Override 
	  public boolean plusCnt(int dormBno) {
	  
	  return dormDao.plusCnt(dormBno); }
	  
	  @Override 
	  public void updateDorm(Dorm dorm) 
	  { dormDao.updateDorm(dorm);
	  
	  }

	@Override
	public void deleteDorm(int dormBno) {
		dormDao.deleteDorm(dormBno);
		
	}
	 

	 


}