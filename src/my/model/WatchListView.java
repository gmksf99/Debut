package my.model;

import java.util.List;

public class WatchListView {

	private int watchTotalCount;//전체 레코드 개수
	private int currentPageNumber;//지금 1페이지인지 2페이지인지.....
	private List<Watch> watchList;//1~5 : 1페이지, 6~10 : 2페이지 ...
	private int pageTotalCount;//토탈페이지 몇개인지
	private int watchCountPerPage;//페이지당 몇개씩 넣는건지

	public WatchListView(List<Watch> watchList, int watchTotalCount,
			int currentPageNumber, int watchCountPerPage) {
		this.watchList = watchList;
		this.watchTotalCount = watchTotalCount;
		this.currentPageNumber = currentPageNumber;
		this.watchCountPerPage = watchCountPerPage;

		calculatePageTotalCount();
	}

	private void calculatePageTotalCount() {
		if (watchTotalCount == 0) {//db에 갯수가 0이면
			pageTotalCount = 0;//페이지도 0
		} else {
			pageTotalCount = watchTotalCount / watchCountPerPage;
			//영화 숫자가 몇개 있는데 페이지당 몇개씩 볼지 나누면 총 몇페이지인지 알수있음
			if (watchTotalCount % watchCountPerPage > 0) {//자투리가 있으면
				pageTotalCount++;//한페이지 더 추가
			}
		}
	}

	public int getWatchTotalCount() {
		return watchTotalCount;
	}

	public void setWatchTotalCount(int watchTotalCount) {
		this.watchTotalCount = watchTotalCount;
	}

	public int getCurrentPageNumber() {
		return currentPageNumber;
	}

	public void setCurrentPageNumber(int currentPageNumber) {
		this.currentPageNumber = currentPageNumber;
	}

	public List<Watch> getWatchList() {
		return watchList;
	}

	public void setWatchList(List<Watch> watchList) {
		this.watchList = watchList;
	}

	public int getPageTotalCount() {
		return pageTotalCount;
	}

	public void setPageTotalCount(int pageTotalCount) {
		this.pageTotalCount = pageTotalCount;
	}	
}