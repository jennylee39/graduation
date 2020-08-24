package kr.ac.skuniv.graduation.service;

import java.util.List;

import kr.ac.skuniv.graduation.dto.Out;
import kr.ac.skuniv.graduation.dto.OutPaging;


public interface OutService {
	public Out regOut(Out out); //insert
	public List<Out> getOuts(OutPaging pagination);
	public Out viewDetail(int outBno); //select one ,상세보기
	public boolean plusCnt(int outBno);
	public void updateOut(Out out);
	public int getOutListCnt();
	public void deleteOut(int outBno);
	public void updateBno(int outBno);
	//public void plusCnt(int outBno, HttpSession session) throws Exception;
	/*
	 * public void userDone(String id); //update 
	 * //select public User getUser(String id); //select one  public boolean loginCheck(User user);
	 */
}
