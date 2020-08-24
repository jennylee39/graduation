package kr.ac.skuniv.graduation.dao;

import java.util.List;

import kr.ac.skuniv.graduation.dto.Notice;
import kr.ac.skuniv.graduation.dto.NoticePaging;
import kr.ac.skuniv.graduation.mapper.Mapper;

@Mapper
public interface NoticeMapper {

	public void addNotice(Notice notice);
	public List<Notice> getNotices(NoticePaging pagination);
	public Notice viewDetail(int bno); // select one , �󼼺��� 
	public boolean plusCnt(int bno); // ��ȸ�� �ø��� 
	public void updateNotice(Notice notice); // �����ϱ�
	public int getNoticeListCnt(); //����¡
	 }
