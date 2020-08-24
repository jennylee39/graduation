package kr.ac.skuniv.graduation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.skuniv.graduation.dao.GalleryMapper;
import kr.ac.skuniv.graduation.dto.Gallery;
import kr.ac.skuniv.graduation.dto.GalleryPaging;

@Service

public class GalleryServiceImpl implements GalleryService {

	@Autowired
	GalleryMapper galleryDao;
	
	@Override
	public void addGallery(Gallery gallery) {
		galleryDao.addGallery(gallery);
	}

	@Override
	public List<Gallery> getGallerys(GalleryPaging pagination) {
		return galleryDao.getGallerys(pagination);
	}
	@Override
	public int getGalleryListCnt() {
		return galleryDao.getGalleryListCnt();
	}
	  @Override 
	  public Gallery viewDetail(int bno) { 
		  return  galleryDao.viewDetail(bno); }
	  
	  @Override 
	  public boolean plusCnt(int bno) {
	  
	  return galleryDao.plusCnt(bno); }
	  
	  @Override 
	  public void updateGallery(Gallery gallery) 
	  { galleryDao.updateGallery(gallery);
	  
	  }

	@Override
	public void deleteGallery(int bno) {
		
		galleryDao.deleteGallery(bno);
	}
	 

	 


}