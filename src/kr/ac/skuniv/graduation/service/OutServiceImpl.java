package kr.ac.skuniv.graduation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;


import kr.ac.skuniv.graduation.dao.OutMapper;
import kr.ac.skuniv.graduation.dto.Out;
import kr.ac.skuniv.graduation.dto.OutPaging;

@Service

public class OutServiceImpl implements OutService {

	@Autowired
	OutMapper outDao;
	
	
	
	@Override
	public Out regOut(Out out) {
		
		outDao.addOut(out);
		return out;
	}

	@Override
	//@Transactional(readOnly=true)
	public List<Out> getOuts(OutPaging pagination) {
		return outDao.getOuts(pagination);
	}

	@Override
	public int getOutListCnt() {
		//System.out.println( outDao.getOutListCnt());
		return outDao.getOutListCnt();
	}
	@Override
	public Out viewDetail(int outBno) {
		
		return outDao.viewDetail(outBno);
	}

	
	  @Override 
	  public boolean plusCnt(int outBno) {
	  
	  return outDao.plusCnt(outBno); }

	@Override
	public void updateOut(Out out) {
		outDao.updateOut(out);
		

	}

	@Override
	public void deleteOut(int outBno) {
		outDao.deleteOut(outBno);
		
	}
	
	public void updateBno(int outBno) {
		outDao.updateBno(outBno);
	}
	
	
	 


}