package kr.ac.skuniv.graduation.dao;

import java.util.List;

import kr.ac.skuniv.graduation.dto.Council;
import kr.ac.skuniv.graduation.mapper.Mapper;

@Mapper
public interface CouncilMapper {
	public Council getCouncil(int id); 
	public List<Council> getCouncils();
	public void addCouncil(Council council);
	public void updateCouncil(Council council); 
	public void deleteCouncil(int id); 
	public Council councilCheck(int id) throws Exception;
}