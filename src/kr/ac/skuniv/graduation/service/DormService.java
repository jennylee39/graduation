package kr.ac.skuniv.graduation.service;

import java.util.List;

import kr.ac.skuniv.graduation.dto.Dorm;
import kr.ac.skuniv.graduation.dto.DormPaging;

public interface DormService {
	public Dorm regDorm(Dorm dormzz); // insert
	public List<Dorm> getDorms(DormPaging pagination);
	public Dorm viewDetail(int dormBno); // select one,상세보기
	public boolean plusCnt(int dormBno);
	public void updateDorm(Dorm dorm);
	public int getDormListCnt();
	public void deleteDorm(int dormBno);
}
