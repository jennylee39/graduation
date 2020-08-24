package kr.ac.skuniv.graduation.dao;

import java.util.List;

import kr.ac.skuniv.graduation.dto.News;
import kr.ac.skuniv.graduation.dto.NewsPaging;
import kr.ac.skuniv.graduation.mapper.Mapper;

@Mapper
public interface NewsMapper {

	public void addNews(News news);
	public List<News> getNewss(NewsPaging pagination);
	public News viewDetail(int bno); // select one , �󼼺��� 
	public boolean plusCnt(int bno); // ��ȸ�� �ø��� 
	public void updateNews(News notice); // �����ϱ�
	public int getNewsListCnt(); //����¡
	 }
