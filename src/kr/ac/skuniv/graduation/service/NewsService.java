package kr.ac.skuniv.graduation.service;

import java.util.List;

import kr.ac.skuniv.graduation.dto.News;
import kr.ac.skuniv.graduation.dto.NewsPaging;

public interface NewsService {
	public News regNews(News news); // insert
	public List<News> getNewss(NewsPaging pagination);
	public News viewDetail(int bno); // select one,상세보기
	public boolean plusCnt(int bno);
	public void updateNews(News news);
	public int getNewsListCnt();
}
