package kr.ac.skuniv.graduation.dao;

import java.util.List;

import kr.ac.skuniv.graduation.dto.Etc;
import kr.ac.skuniv.graduation.dto.EtcPaging;
import kr.ac.skuniv.graduation.mapper.Mapper;

@Mapper
public interface EtcMapper {

	public void addEtc(Etc etc);
	public List<Etc> getEtcs(EtcPaging pagination);
	public Etc viewDetail(int etcBno); // select one , �󼼺���
	public boolean plusCnt(int etcBno); // ��ȸ�� �ø���
	public void updateEtc(Etc etc); // �����ϱ�
	public int getEtcListCnt();
}
