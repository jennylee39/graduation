package kr.ac.skuniv.graduation.dto;

import java.sql.Timestamp;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
//봉사활동, 상담 신청
@Data
public class Formula {
	private int bno; // 게시물 번호
	private String title; // 게시물 제목
	private String text; // 외박 목적,이유
	private String writer; // 글쓴이
	private String id;
	private String rink1;
	private String rink2;
	private String orgname1;
	private String orgname2;
	private MultipartFile file; //파일 업로드용
	private MultipartFile file2;
	private String path1;
	private String path2;
	private Timestamp addDate; // 게시 날짜
	private int count; // 조회수
	
}
