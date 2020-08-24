package kr.ac.skuniv.graduation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.skuniv.graduation.dao.EtcMapper;
import kr.ac.skuniv.graduation.dto.Etc;
import kr.ac.skuniv.graduation.dto.EtcPaging;

@Service

public class EtcServiceImpl implements EtcService {

	@Autowired
	EtcMapper etcDao;
	
	@Override
	public Etc regEtc(Etc etc) {
		etcDao.addEtc(etc);
		return etc;
	}

	@Override
	public List<Etc> getEtcs(EtcPaging pagination) {
		return etcDao.getEtcs(pagination);
	}
	
	@Override
	public int getEtcListCnt() {
		return etcDao.getEtcListCnt();
	}
	@Override
	public Etc viewDetail(int etcBno) {
		return etcDao.viewDetail(etcBno);
	}

	@Override
	public boolean plusCnt(int etcBno) {
		
		return etcDao.plusCnt(etcBno);
	}

	@Override
	public void updateEtc(Etc etc) {
		etcDao.updateEtc(etc);
		
	}

	 


}