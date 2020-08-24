package kr.ac.skuniv.graduation.dao;

import java.util.List;

import kr.ac.skuniv.graduation.dto.News;
import kr.ac.skuniv.graduation.dto.NewsPaging;
import kr.ac.skuniv.graduation.mapper.Mapper;

@Mapper
public interface NewsMapper {

	public void addNews(News news);
	public List<News> getNewss(NewsPaging pagination);
	public News viewDetail(int bno); // select one , 상세보기 
	public boolean plusCnt(int bno); // 조회수 올리기 
	public void updateNews(News notice); // 수정하기
	public int getNewsListCnt(); //페이징
	 }
