package kr.ac.skuniv.graduation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import kr.ac.skuniv.graduation.dao.CouncilMapper;
import kr.ac.skuniv.graduation.dto.Council;

@Service
@Repository
public class CouncilServiceImpl implements CouncilService {

	@Autowired
	CouncilMapper councilDao;
	
	@Override
	public void addCouncil(Council council) {
		councilDao.addCouncil(council);
	
	}
	
	@Override
	public Council getCouncil(int id) {
		
		return councilDao.getCouncil(id);
	}

	
	  @Override 
	  public void deleteCouncil(int id) {
	  
		  councilDao.deleteCouncil(id);
	  }


	@Override
	public List<Council> getCouncils() {
		
		return councilDao.getCouncils();
	}

	@Override
	public void updateCouncil(Council council) {
		councilDao.updateCouncil(council);
		
	}

	public Council councilCheck(int id) throws Exception{
		return councilDao.councilCheck(id);
	}
	 
}
