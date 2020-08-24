package kr.ac.skuniv.graduation.dao;

import java.util.List;

import kr.ac.skuniv.graduation.dto.Formula;
import kr.ac.skuniv.graduation.dto.FormulaPaging;
import kr.ac.skuniv.graduation.mapper.Mapper;

@Mapper
public interface FormulaMapper {

	public void addFormula(Formula formula);
	public List<Formula> getFormulas(FormulaPaging pagination);
	public Formula viewDetail(int bno); // select one , 상세보기 
	public boolean plusCnt(int bno); // 조회수 올리기 
	public void updateFormula(Formula formula); // 수정하기
	public int getFormulaListCnt(); //페이징
	public void deleteFormula(int bno);
}
