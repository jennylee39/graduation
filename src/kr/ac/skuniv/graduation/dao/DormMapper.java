package kr.ac.skuniv.graduation.dao;

import java.util.List;

import kr.ac.skuniv.graduation.dto.Dorm;
import kr.ac.skuniv.graduation.dto.DormPaging;
import kr.ac.skuniv.graduation.mapper.Mapper;

@Mapper
public interface DormMapper {

	public void addDorm(Dorm dorm);
	public List<Dorm> getDorms(DormPaging pagination);
	public Dorm viewDetail(int dormBno); // select one , 상세보기 
	public boolean plusCnt(int dormBno); // 조회수 올리기 
	public void updateDorm(Dorm dorm); // 수정하기
	public int getDormListCnt(); //페이징
	public void deleteDorm(int dormBno);
	 }
