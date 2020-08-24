package kr.ac.skuniv.graduation.dto;

import java.sql.Timestamp;

import lombok.Data;
//외박 신청 정보
@Data
public class Out {
	private int outBno; // 게시물 번호
	private String title; // 게시물 제목
	private String outTerm; //외박 기간
	private String outStart; // 날짜시작
	private String outFinish; // 날짜
	private String place; // 목적지
	private String phoneNum; // 휴대번호
	private String emerPhone; // 비상번호
	private String why; // 외박 목적,이유
	private String writer; // 글쓴이
	private String id;
	private Timestamp addDate; // 게시 날짜
	private int count; // 조회수

	
}
