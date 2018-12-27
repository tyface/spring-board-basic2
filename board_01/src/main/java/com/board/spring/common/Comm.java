package com.board.spring.common;

import java.util.HashMap;
import java.util.Map;

/**
 * 공용 메서드
 * @author 유지상
 */
public class Comm {
	
	/**
	 * 페이징 정보 셋팃
	 * @param currentPage		현제페이지 번호
	 * @param totalCount 		전체 게시글 갯수
	 * @param pageListCount 	한페이지에 보여질 게시글 갯수
	 * @param pageNavCount 	  	한번에 보여줄 페이지 네비게이터에 갯수(한줄에 몇개의 페이지번호 표출 할 것인지)
	 * @return 페이지 정보 
	 */
	public static Map<String, Integer> setPageInfo(int currentPage, int totalCount, 
			int pageListCount, int pageNavCount ){
		// 페이징에 필요한 데이터를 Map에 셋팅
		Map<String, Integer> pageInfoMap = new HashMap<String, Integer>();
		// 페이지 갯수 
		int totalPage = (int)Math.ceil(totalCount / (double)pageListCount);
		// 이전 페이지 번호
		int prevPage = currentPage <= 1 ? 1 : currentPage - 1;
		// 다은 페이지 번호
		int nextPage = currentPage >= totalPage ? totalPage : currentPage + 1;
		// 현제 페이지 기준 처음 페이지 번호
		int firstPage = currentPage - ((currentPage-1)%pageListCount);
		// 현제 페이지 기준 마지막 페이지 번호
		int lastPage = firstPage + (pageListCount-1);
		
		// 페이지 번호 예외처리
		if(currentPage <= 1) {
			currentPage = 1;
		}else if (currentPage > totalPage) {
			currentPage = totalPage;
		}
		
		if (lastPage > totalPage) {
			lastPage = totalPage;
		}
		
		// 현제페이지의 첫번째 게시글 번호
		int startNum = (currentPage - 1 ) * pageListCount;
		
		pageInfoMap.put("totalCount", totalCount);		// 전체 게시글 갯수
		pageInfoMap.put("firstPage", firstPage);		// 현제 페이지 기준 처음 페이지 번호
		pageInfoMap.put("lastPage", lastPage);			// 현제 페이지 기준 마지막 페이지 번호
		pageInfoMap.put("startNum", startNum);			// 현제 페이지의 첫번째 게시글 번호
		pageInfoMap.put("listCount", pageListCount);	// 한 페이지에 보여질 게시글 갯수
		pageInfoMap.put("prevPage", prevPage);			// 이전 페이지 번호
		pageInfoMap.put("currentPage", currentPage);	// 현제 페이지 번호
		pageInfoMap.put("nextPage", nextPage);			// 다음 페이지 번호
		
		return pageInfoMap;
	}
}
