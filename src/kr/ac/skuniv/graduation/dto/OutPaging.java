package kr.ac.skuniv.graduation.dto;

import lombok.Data;

@Data
public class OutPaging {

	private int listSize1 = 10; // 초기값으로 목록개수를 10으로 셋팅
	private int rangeSize1 = 5; // 초기값으로 페이지범위를 10으로 셋팅
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

		//전체 페이지수 
		this.pageCnt1 = (int)Math.ceil((double)listCnt1/listSize1);
		//시작 페이지
		this.startPage1= (range1 - 1) * rangeSize1 + 1 ;
		
		//끝 페이지
		this.endPage1 = range1 * rangeSize1;

		//게시판 시작번호
		this.startList1 = (page1 - 1) * listSize1;

		//이전 버튼 상태
		this.prev1 = range1 == 1 ? false : true;		

		//다음 버튼 상태
		this.next1 = endPage1 > pageCnt1 ? false : true;

		if (this.endPage1 > this.pageCnt1) {
			this.endPage1 = this.pageCnt1;
			this.next1 = false;
		}
	}
}
