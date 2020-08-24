package kr.ac.skuniv.graduation.dto;

import lombok.Data;

@Data
public class FreePaging {

	private int listSize = 12; // �ʱⰪ���� ��ϰ����� 10���� ����
	private int rangeSize =3; // �ʱⰪ���� ������������ 10���� ����
	private int page;
	private int range;
	private int listCnt;
	private int pageCnt;
	private int startPage;
	private int startList;
	private int endPage;
	private boolean prev;
	private boolean next;
	

	public void pageInfo(int page, int range, int listCnt) {

		
		this.page = page;

		this.range = range;

		this.listCnt = listCnt;

		
		//��ü �������� 
		this.pageCnt = (int)Math.ceil((double)listCnt/listSize);

		//���� ������
		this.startPage = (range - 1) * rangeSize + 1 ;

		//�� ������
		this.endPage = range * rangeSize;

		//�Խ��� ���۹�ȣ
		this.startList = (page - 1) * listSize;

		//���� ��ư ����
		this.prev = range == 1 ? false : true;
		
		//���� ��ư ����
		this.next = endPage > pageCnt ? false : true;
		if (this.endPage > this.pageCnt) {
			this.endPage = this.pageCnt;
			this.next = false;

		}

	}
}
