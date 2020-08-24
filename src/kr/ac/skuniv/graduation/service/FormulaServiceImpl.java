package kr.ac.skuniv.graduation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.skuniv.graduation.dao.FormulaMapper;
import kr.ac.skuniv.graduation.dto.Formula;
import kr.ac.skuniv.graduation.dto.FormulaPaging;


@Service

public class FormulaServiceImpl implements FormulaService {

	@Autowired
	FormulaMapper formulaDao;
	
	@Override
	public void addFormula(Formula formula) {
		formulaDao.addFormula(formula);
	}

	@Override
	public List<Formula> getFormulas(FormulaPaging pagination) {
		return formulaDao.getFormulas(pagination);
	}
	@Override
	public int getFormulaListCnt() {
		return formulaDao.getFormulaListCnt();
	}
	  @Override 
	  public Formula viewDetail(int bno) { 
		  return  formulaDao.viewDetail(bno); }
	  
	  @Override 
	  public boolean plusCnt(int bno) {
	  
	  return formulaDao.plusCnt(bno); }
	  
	  @Override 
	  public void updateFormula(Formula formula) 
	  { formulaDao.updateFormula(formula);
	  
	  }

	@Override
	public void deleteFormula(int bno) {
		formulaDao.deleteFormula(bno);
		
	}
	 

	 


}