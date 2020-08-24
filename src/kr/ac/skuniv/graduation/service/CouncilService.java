package kr.ac.skuniv.graduation.service;

import java.util.List;

import kr.ac.skuniv.graduation.dto.Council;

public interface CouncilService {
	public void addCouncil(Council council); //insert
	public List<Council> getCouncils();//select 
	public Council getCouncil(int id);  //select one
	public void updateCouncil(Council rule); 
	public void deleteCouncil(int id); 
	public Council councilCheck(int id) throws Exception;
}
