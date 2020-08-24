package kr.ac.skuniv.graduation.dao;

import java.util.List;

import kr.ac.skuniv.graduation.dto.Etc;
import kr.ac.skuniv.graduation.dto.EtcPaging;
import kr.ac.skuniv.graduation.mapper.Mapper;

@Mapper
public interface EtcMapper {

	public void addEtc(Etc etc);
	public List<Etc> getEtcs(EtcPaging pagination);
	public Etc viewDetail(int etcBno); // select one , 상세보기
	public boolean plusCnt(int etcBno); // 조회수 올리기
	public void updateEtc(Etc etc); // 수정하기
	public int getEtcListCnt();
}
