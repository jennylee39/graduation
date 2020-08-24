package kr.ac.skuniv.graduation.dto;

import java.sql.Timestamp;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
//����Ȱ��, ��� ��û
@Data
public class Dorm {
	private int dormBno; // �Խù� ��ȣ
	private String title; // �Խù� ����
	private String text; // �ܹ� ����,����
	private String writer; // �۾���
	private String id;
	private String orgname;
	private String newname;
	private String orgname2;
	private String newname2;
	private MultipartFile file; //���� ���ε��
	private MultipartFile file2;
	private String path;
	private String path2;
	private Timestamp addDate; // �Խ� ��¥
	private int count; // ��ȸ��
	
}
