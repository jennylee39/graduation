package kr.ac.skuniv.graduation.dto;

import lombok.Data;

@Data
public class NoticePaging {

	private int listSize = 15; // 초기값으로 목록개수를 10으로 셋팅

	private int rangeSize = 3; // 초기값으로 페이지범위를 10으로 셋팅

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

		

		//전체 페이지수 

		this.pageCnt = (int)Math.ceil((double)listCnt/listSize);

		

		//시작 페이지

		this.startPage = (range - 1) * rangeSize + 1 ;

		

		//끝 페이지

		this.endPage = range * rangeSize;

				

		//게시판 시작번호

		this.startList = (page - 1) * listSize;

		

		//이전 버튼 상태

		this.prev = range == 1 ? false : true;

		

		//다음 버튼 상태

		this.next = endPage > pageCnt ? false : true;

		if (this.endPage > this.pageCnt) {

			this.endPage = this.pageCnt;

			this.next = false;

		}

	}
}
