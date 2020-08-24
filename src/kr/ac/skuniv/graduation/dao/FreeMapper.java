package kr.ac.skuniv.graduation.dao;

import java.util.List;

import kr.ac.skuniv.graduation.dto.Free;
import kr.ac.skuniv.graduation.dto.FreePaging;
import kr.ac.skuniv.graduation.mapper.Mapper;

@Mapper
public interface FreeMapper {

	public void addFree(Free free);
	public List<Free> getFrees(FreePaging pagination);
	public Free viewDetail(int bno); // select one , �󼼺��� 
	public boolean plusCnt(int bno); // ��ȸ�� �ø��� 
	public void updateFree(Free free); // �����ϱ�
	public int getFreeListCnt(); //����¡
	public void deleteFree(int bno);
	 }
