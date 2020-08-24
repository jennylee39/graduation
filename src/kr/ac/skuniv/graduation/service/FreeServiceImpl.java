package kr.ac.skuniv.graduation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.skuniv.graduation.dao.FreeMapper;
import kr.ac.skuniv.graduation.dto.Free;
import kr.ac.skuniv.graduation.dto.FreePaging;

@Service

public class FreeServiceImpl implements FreeService {

	@Autowired
	FreeMapper freeDao;
	
	@Override
	public void addFree(Free free) {
		freeDao.addFree(free);
	}

	@Override
	public List<Free> getFrees(FreePaging pagination) {
		return freeDao.getFrees(pagination);
	}
	@Override
	public int getFreeListCnt() {
		return freeDao.getFreeListCnt();
	}
	  @Override 
	  public Free viewDetail(int bno) { 
		  return  freeDao.viewDetail(bno); }
	  
	  @Override 
	  public boolean plusCnt(int bno) {
	  
	  return freeDao.plusCnt(bno); }
	  
	  @Override 
	  public void updateFree(Free free) 
	  { freeDao.updateFree(free);
	  
	  }

	@Override
	public void deleteFree(int bno) {
		
		freeDao.deleteFree(bno);
	}
	 

	 


}