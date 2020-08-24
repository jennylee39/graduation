package kr.ac.skuniv.graduation.service;

import java.util.List;

import kr.ac.skuniv.graduation.dto.Free;
import kr.ac.skuniv.graduation.dto.FreePaging;

public interface FreeService {
	public void addFree(Free free);
	public List<Free> getFrees(FreePaging pagination);
	public Free viewDetail(int bno); // select one , 상세보기 
	public boolean plusCnt(int bno); // 조회수 올리기 
	public void updateFree(Free free); // 수정하기
	public int getFreeListCnt(); //페이징
	public void deleteFree(int bno);
}
