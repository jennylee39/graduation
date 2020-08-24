package kr.ac.skuniv.graduation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.skuniv.graduation.dao.NoticeMapper;
import kr.ac.skuniv.graduation.dto.Notice;
import kr.ac.skuniv.graduation.dto.NoticePaging;

@Service

public class NoticeServiceImpl implements NoticeService {

	@Autowired
	NoticeMapper noticeDao;
	
	@Override
	public Notice regNotice(Notice notice) {
		noticeDao.addNotice(notice);
		return notice;
	}

	@Override
	public List<Notice> getNotices(NoticePaging pagination) {
		return noticeDao.getNotices(pagination);
	}
	@Override
	public int getNoticeListCnt() {
		return noticeDao.getNoticeListCnt();
	}
	  @Override 
	  public Notice viewDetail(int bno) { 
		  return  noticeDao.viewDetail(bno); }
	  
	  @Override 
	  public boolean plusCnt(int bno) {
	  
	  return noticeDao.plusCnt(bno); }
	  
	  @Override 
	  public void updateNotice(Notice notice) 
	  { noticeDao.updateNotice(notice);
	  
	  }
	 

	 


}