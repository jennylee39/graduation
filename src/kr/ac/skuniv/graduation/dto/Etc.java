package kr.ac.skuniv.graduation.dto;

import java.sql.Timestamp;

import lombok.Data;
//����Ȱ��, ��� ��û
@Data
public class Etc {
	private int etcBno; // �Խù� ��ȣ
	private String title; // �Խù� ����
	private String text; // �ܹ� ����,����
	private String writer; // �۾���
	private String id;
	private Timestamp addDate; // �Խ� ��¥
	private int count; // ��ȸ��

	
}
