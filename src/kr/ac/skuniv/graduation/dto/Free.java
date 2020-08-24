package kr.ac.skuniv.graduation.dto;

import java.sql.Timestamp;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
//봉사활동, 상담 신청
@Data
public class Free {
	private int bno; // 게시물 번호
	private String title; // 게시물 제목
	private String text; // 외박 목적,이유
	private String writer; // 글쓴이
	private String id;
	private String rink1;
	private String rink2;
	private String orgname1;
	private String orgname2;
	private String orgname3;
	private String orgname4;
	private String orgname5;
	private String path1;
	private String path2;
	private String path3;
	private String path4;
	private String path5;
	private MultipartFile file1; //파일 업로드용
	private MultipartFile file2;
	private MultipartFile file3;
	private MultipartFile file4;
	private MultipartFile file5;
	private Timestamp addDate; // 게시 날짜
	private int count; // 조회수
	
}
