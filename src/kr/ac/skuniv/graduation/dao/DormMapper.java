package kr.ac.skuniv.graduation.dao;

import java.util.List;

import kr.ac.skuniv.graduation.dto.Dorm;
import kr.ac.skuniv.graduation.dto.DormPaging;
import kr.ac.skuniv.graduation.mapper.Mapper;

@Mapper
public interface DormMapper {

	public void addDorm(Dorm dorm);
	public List<Dorm> getDorms(DormPaging pagination);
	public Dorm viewDetail(int dormBno); // select one , �󼼺��� 
	public boolean plusCnt(int dormBno); // ��ȸ�� �ø��� 
	public void updateDorm(Dorm dorm); // �����ϱ�
	public int getDormListCnt(); //����¡
	public void deleteDorm(int dormBno);
	 }
