package ac.hansung.show.service;

import org.springframework.stereotype.Service;

@Service
public class Page {
//	현재 페이지, 총 글의 개수, 한 페이지에 보여줄 글 수, 보여질 링크 수
	private int cPage, count, rows, pageBlock;
//	이전 페이지, 이후 페이지 존재 유무
	private boolean isPrevPage, isNextPage;
//	총 페이지의 수, 시작 페이지, 끝 페이지
	private int totalPage, startPage, endPage;
//	글의 시작과 끝 Row
	private int startRow, endRow;
//	String 형식으로 HTML 코드를 Buffer에 담아서 보냄
	private StringBuffer sb;
	
//	생성자(현재 페이지, 총 글의 개수, 한 페이지에 보여줄 글, 보여질 링크 수)
//	DI 시킬 때 디폴트 생성자가 아닐 경우 super()를 호출하거나 디폴트 생성자를 생성해야 함
	public void setPageInit(int cPage, int count, int rows, int pageBlock, String path) {
		this.cPage = cPage;
		this.count = count;
		this.rows = rows;
		this.pageBlock = pageBlock;
		
		paging(path);
	}
	
	public void paging(String path) {
		totalPage = (int) Math.ceil((double)count / rows);
		startRow = (cPage-1) * rows+1;
		endRow = cPage * rows;
		
		startPage = (int)((cPage-1)/pageBlock) * pageBlock + 1;
		endPage = startPage + pageBlock - 1;
		
		if(endPage > totalPage) {
			endPage = totalPage;
		}
		
		if(startPage > 1) {
			isPrevPage = true;
		}
		
		if(endPage < totalPage) {
			isNextPage = true;
		}
		
		sb = new StringBuffer();
		if(startPage < pageBlock) {
			sb.append("<img src = 'resources/images/pre.png' width = '30' height = '30'>");
		}
		else {
			sb.append("<img src = 'resources/images/pre.png' width = '30' height = '30'");
			sb.append(" onclick = 'location.href = \"");
			sb.append(path);
			sb.append("?cPage=");
			sb.append(startPage - pageBlock);
			sb.append("\"' style = 'cursor:pointer'> ");
		}
		
		sb.append("&nbsp;|");
		for(int i=startPage; i<=endPage; i++) {
			if(i==cPage) {
				sb.append("&nbsp; <b> <font size='5' color = '#91B7EF' >");
				sb.append(i);
				sb.append("</font></b>");
			}
			else {
				sb.append("<font size='5'>");
				sb.append("&nbsp; <a href = '");
				sb.append(path);
				sb.append("?cPage=");
				sb.append(i);
				sb.append("' style='text-decoration:none' alink='#000000' vlink='#FF007F' >");
				sb.append(i);
				sb.append("</a> ");
				sb.append ("</font>");
			}
		}

		sb.append("&nbsp | &nbsp;");
		if(endPage < totalPage) {
			sb.append("<img src = 'resources/images/next.png' width = '30' height = '30'");
			sb.append(" onclick = 'location.href = \"");
			sb.append(path);
			sb.append("?cPage=");
			sb.append(startPage + pageBlock);
			sb.append("\"' style='cursor:pointer'> ");
		}
		else {
			sb.append("<img src = 'resources/images/next.png' width = '30' height = '30'>");

		}
	}
	
	public int getStartRow() {
		return startRow;
	}
	
	public int getEndRow() {
		return endRow;
	}
	
	public StringBuffer getSb() {
		return sb;
	}
}
