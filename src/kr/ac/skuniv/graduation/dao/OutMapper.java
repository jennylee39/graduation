package kr.ac.skuniv.graduation.dao;

import java.util.List;

import kr.ac.skuniv.graduation.dto.Out;
import kr.ac.skuniv.graduation.dto.OutPaging;
import kr.ac.skuniv.graduation.mapper.Mapper;

@Mapper
public interface OutMapper {

	public void addOut(Out out);
	public List<Out> getOuts(OutPaging pagination);
	public Out viewDetail(int outBno); // select one , 상세보기
	public boolean plusCnt(int outBno); // 조회수 올리기
	public void updateOut(Out out); // 수정하기
	public int getOutListCnt();
	public void deleteOut(int outBno);
	public void updateBno(int outBno);
}
