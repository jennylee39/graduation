package kr.ac.skuniv.graduation.service;

import java.util.List;

import kr.ac.skuniv.graduation.dto.Gallery;
import kr.ac.skuniv.graduation.dto.GalleryPaging;

public interface GalleryService {
	public void addGallery(Gallery gallery);
	public List<Gallery> getGallerys(GalleryPaging pagination);
	public Gallery viewDetail(int bno); // select one , �󼼺��� 
	public boolean plusCnt(int bno); // ��ȸ�� �ø��� 
	public void updateGallery(Gallery gallery); // �����ϱ�
	public int getGalleryListCnt(); //����¡
	public void deleteGallery(int bno);
}
