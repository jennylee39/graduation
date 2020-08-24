package kr.ac.skuniv.graduation.service;

import java.util.List;

import kr.ac.skuniv.graduation.dto.Formula;
import kr.ac.skuniv.graduation.dto.FormulaPaging;

public interface FormulaService {
	public void addFormula(Formula formula);
	public List<Formula> getFormulas(FormulaPaging pagination);
	public Formula viewDetail(int bno); // select one , �󼼺��� 
	public boolean plusCnt(int bno); // ��ȸ�� �ø��� 
	public void updateFormula(Formula formula); // �����ϱ�
	public int getFormulaListCnt(); //����¡
	public void deleteFormula(int bno);
}
