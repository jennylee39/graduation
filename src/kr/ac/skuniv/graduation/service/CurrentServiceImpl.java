package kr.ac.skuniv.graduation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import kr.ac.skuniv.graduation.dao.CurrentMapper;
import kr.ac.skuniv.graduation.dto.Current;


@Service
@Repository
public class CurrentServiceImpl implements CurrentService {

	@Autowired
	CurrentMapper currentDao;
	
	@Override
	public void addCurrent(Current current) {
		currentDao.addCurrent(current);
	
	}
	
	@Override
	public Current getCurrent(String id) {
		
		return currentDao.getCurrent(id);
	}

	
	  @Override 
	  public void deleteCurrent(String id) {
	  
		  currentDao.deleteCurrent(id);
	  }


	@Override
	public List<Current> getCurrents() {
		
		return currentDao.getCurrents();
	}

	@Override
	public void updateCurrent(Current current) {
		currentDao.updateCurrent(current);
		
	}

	public Current currentCheck(String id) throws Exception{
		return currentDao.currentCheck(id);
	}
	 
}
