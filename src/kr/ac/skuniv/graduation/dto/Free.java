package kr.ac.skuniv.graduation.dto;

import java.sql.Timestamp;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
//����Ȱ��, ��� ��û
@Data
public class Free {
	private int bno; // �Խù� ��ȣ
	private String title; // �Խù� ����
	private String text; // �ܹ� ����,����
	private String writer; // �۾���
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
	private MultipartFile file1; //���� ���ε��
	private MultipartFile file2;
	private MultipartFile file3;
	private MultipartFile file4;
	private MultipartFile file5;
	private Timestamp addDate; // �Խ� ��¥
	private int count; // ��ȸ��
	
}
