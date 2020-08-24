package kr.ac.skuniv.graduation.dao;

import java.util.List;

import kr.ac.skuniv.graduation.dto.Gallery;
import kr.ac.skuniv.graduation.dto.GalleryPaging;
import kr.ac.skuniv.graduation.mapper.Mapper;

@Mapper
public interface GalleryMapper {

	public void addGallery(Gallery gallery);
	public List<Gallery> getGallerys(GalleryPaging pagination);
	public Gallery viewDetail(int bno); // select one , 상세보기 
	public boolean plusCnt(int bno); // 조회수 올리기 
	public void updateGallery(Gallery gallery); // 수정하기
	public int getGalleryListCnt(); //페이징
	public void deleteGallery(int bno);
	 }
