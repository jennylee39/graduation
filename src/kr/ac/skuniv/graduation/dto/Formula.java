package kr.ac.skuniv.graduation.dto;

import java.sql.Timestamp;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
//����Ȱ��, ��� ��û
@Data
public class Formula {
	private int bno; // �Խù� ��ȣ
	private String title; // �Խù� ����
	private String text; // �ܹ� ����,����
	private String writer; // �۾���
	private String id;
	private String rink1;
	private String rink2;
	private String orgname1;
	private String orgname2;
	private MultipartFile file; //���� ���ε��
	private MultipartFile file2;
	private String path1;
	private String path2;
	private Timestamp addDate; // �Խ� ��¥
	private int count; // ��ȸ��
	
}
