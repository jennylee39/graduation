package kr.ac.skuniv.graduation.dto;

import lombok.Data;

@Data
public class OutPaging {

	private int listSize1 = 10; // �ʱⰪ���� ��ϰ����� 10���� ����
	private int rangeSize1 = 5; // �ʱⰪ���� ������������ 10���� ����
	private int page1;
	private int range1;
	private int listCnt1;
	private int pageCnt1;
	private int startPage1;
	private int startList1;
	private int endPage1;
	private boolean prev1;
	private boolean next1;
	
	public void pageInfo1(int page1, int range1, int listCnt1) {

		this.page1 = page1;
		this.range1 = range1;
		this.listCnt1 = listCnt1;

		//��ü �������� 
		this.pageCnt1 = (int)Math.ceil((double)listCnt1/listSize1);
		//���� ������
		this.startPage1= (range1 - 1) * rangeSize1 + 1 ;
		
		//�� ������
		this.endPage1 = range1 * rangeSize1;

		//�Խ��� ���۹�ȣ
		this.startList1 = (page1 - 1) * listSize1;

		//���� ��ư ����
		this.prev1 = range1 == 1 ? false : true;		

		//���� ��ư ����
		this.next1 = endPage1 > pageCnt1 ? false : true;

		if (this.endPage1 > this.pageCnt1) {
			this.endPage1 = this.pageCnt1;
			this.next1 = false;
		}
	}
}
