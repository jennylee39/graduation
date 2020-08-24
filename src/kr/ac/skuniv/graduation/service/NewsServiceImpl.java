package kr.ac.skuniv.graduation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.skuniv.graduation.dao.NewsMapper;
import kr.ac.skuniv.graduation.dto.News;
import kr.ac.skuniv.graduation.dto.NewsPaging;

@Service

public class NewsServiceImpl implements NewsService {

	@Autowired
	NewsMapper newsDao;
	
	@Override
	public News regNews(News news) {
		newsDao.addNews(news);
		return news;
	}

	@Override
	public List<News> getNewss(NewsPaging pagination) {
		return newsDao.getNewss(pagination);
	}
	@Override
	public int getNewsListCnt() {
		return newsDao.getNewsListCnt();
	}
	  @Override 
	  public News viewDetail(int bno) { 
		  return  newsDao.viewDetail(bno); }
	  
	  @Override 
	  public boolean plusCnt(int bno) {
	  
	  return newsDao.plusCnt(bno); }
	  
	  @Override 
	  public void updateNews(News news) 
	  { newsDao.updateNews(news);
	  
	  }
	 

	 


}