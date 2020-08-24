package kr.ac.skuniv.graduation.service;

import java.util.List;

import kr.ac.skuniv.graduation.dto.Notice;
import kr.ac.skuniv.graduation.dto.NoticePaging;

public interface NoticeService {
	public Notice regNotice(Notice notice); // insert
	public List<Notice> getNotices(NoticePaging pagination);
	public Notice viewDetail(int bno); // select one,상세보기
	public boolean plusCnt(int bno);
	public void updateNotice(Notice notice);
	public int getNoticeListCnt();
}
