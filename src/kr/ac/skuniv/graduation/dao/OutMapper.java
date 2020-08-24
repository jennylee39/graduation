package kr.ac.skuniv.graduation.dao;

import java.util.List;

import kr.ac.skuniv.graduation.dto.Out;
import kr.ac.skuniv.graduation.dto.OutPaging;
import kr.ac.skuniv.graduation.mapper.Mapper;

@Mapper
public interface OutMapper {

	public void addOut(Out out);
	public List<Out> getOuts(OutPaging pagination);
	public Out viewDetail(int outBno); // select one , �󼼺���
	public boolean plusCnt(int outBno); // ��ȸ�� �ø���
	public void updateOut(Out out); // �����ϱ�
	public int getOutListCnt();
	public void deleteOut(int outBno);
	public void updateBno(int outBno);
}
