package kr.ac.skuniv.graduation.dto;

import lombok.Data;
//사용자 정보
@Data
public class User {
	private String user_id;
	private String user_pwd;
	private String name;
	private String email1;
	private String email2;
	private String room;
	private String job;
	private String school;
	private String dept;
	private String phoneNum;
	private String address;
	private String role;
	
}
