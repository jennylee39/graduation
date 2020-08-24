package kr.ac.skuniv.graduation.dao;

import java.util.List;

import kr.ac.skuniv.graduation.dto.Notice;
import kr.ac.skuniv.graduation.dto.NoticePaging;
import kr.ac.skuniv.graduation.mapper.Mapper;

@Mapper
public interface NoticeMapper {

	public void addNotice(Notice notice);
	public List<Notice> getNotices(NoticePaging pagination);
	public Notice viewDetail(int bno); // select one , 상세보기 
	public boolean plusCnt(int bno); // 조회수 올리기 
	public void updateNotice(Notice notice); // 수정하기
	public int getNoticeListCnt(); //페이징
	 }
