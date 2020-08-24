package kr.ac.skuniv.graduation.dto;

import lombok.Data;
//운영 규정
@Data
public class Rule {
	private int id; //번호
	private String content; // 내용
	private int minus; // 벌점
	private String refer; // 비고

	
}
