package kr.ac.skuniv.graduation.service;

import java.util.List;


import kr.ac.skuniv.graduation.dto.Etc;
import kr.ac.skuniv.graduation.dto.EtcPaging;



public interface EtcService {
	public Etc regEtc(Etc etc); //insert
	public List<Etc> getEtcs(EtcPaging pagination);
	public Etc viewDetail(int etcBno); //select one ,상세보기
	public boolean plusCnt(int etcBno);
	public void updateEtc(Etc etc);
	public int getEtcListCnt();

}
