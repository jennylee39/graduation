package kr.ac.skuniv.graduation.dto;

import java.sql.Timestamp;

import lombok.Data;
//�ܹ� ��û ����
@Data
public class Out {
	private int outBno; // �Խù� ��ȣ
	private String title; // �Խù� ����
	private String outTerm; //�ܹ� �Ⱓ
	private String outStart; // ��¥����
	private String outFinish; // ��¥
	private String place; // ������
	private String phoneNum; // �޴��ȣ
	private String emerPhone; // ����ȣ
	private String why; // �ܹ� ����,����
	private String writer; // �۾���
	private String id;
	private Timestamp addDate; // �Խ� ��¥
	private int count; // ��ȸ��

	
}
