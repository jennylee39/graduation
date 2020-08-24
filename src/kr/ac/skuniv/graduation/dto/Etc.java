package kr.ac.skuniv.graduation.dto;

import java.sql.Timestamp;

import lombok.Data;
//봉사활동, 상담 신청
@Data
public class Etc {
	private int etcBno; // 게시물 번호
	private String title; // 게시물 제목
	private String text; // 외박 목적,이유
	private String writer; // 글쓴이
	private String id;
	private Timestamp addDate; // 게시 날짜
	private int count; // 조회수

	
}
