package kr.ac.skuniv.graduation.dto;

import lombok.Data;
//����� ����
@Data
public class Admin {
	private String admin_id;
	private String admin_pwd;
	private String name;
	private String email1;
	private String email2;
	private String phoneNum;
	private String address;
	private String role;
	
}
