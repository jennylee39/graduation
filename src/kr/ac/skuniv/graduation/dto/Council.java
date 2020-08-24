package kr.ac.skuniv.graduation.dto;

import lombok.Data;
//운영 규정
@Data
public class Council {
	private int id; //번호
	private String role; // 역할
	private String name; // 이름
	private String grade; //학년

}
