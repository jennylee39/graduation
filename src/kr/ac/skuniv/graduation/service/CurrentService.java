package kr.ac.skuniv.graduation.service;

import java.util.List;

import kr.ac.skuniv.graduation.dto.Current;

public interface CurrentService {
	public Current getCurrent(String id); 
	public List<Current> getCurrents();
	public void addCurrent(Current current);
	public void updateCurrent(Current current); 
	public void deleteCurrent(String id); 
	public Current currentCheck(String id) throws Exception;
}
