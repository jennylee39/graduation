package kr.ac.skuniv.graduation.dao;

import java.util.List;

import kr.ac.skuniv.graduation.dto.Current;
import kr.ac.skuniv.graduation.mapper.Mapper;

@Mapper
public interface CurrentMapper {
	public Current getCurrent(String id); 
	public List<Current> getCurrents();
	public void addCurrent(Current current);
	public void updateCurrent(Current current); 
	public void deleteCurrent(String id); 
	public Current currentCheck(String id) throws Exception;
}