package bbs.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bbs.util.paging;
import mybatis.dao.AnnDAO;
import mybatis.dao.NewsDAO;
import mybatis.vo.AnnVO;
import mybatis.vo.NewsVO;

public class N_ListAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// 페이징 처리를 위한 작업
		paging page = new paging();
		
		// 전체 페이지 수를 구하기 위해 먼저
		// 총 게시물의 수를 구해서 전체페이지 값을 지정한다.
		page.setTotalRecord(NewsDAO.getTotalCount());
		
		// 위의 총 게시물의 수가 정해지면서 자동적으로
		// 총 페이지 수가 변경(지정)된다.
		
		//파라미터로 현재 페이지 값이 있는지 받아본다.
		String cPage = request.getParameter("cPage");
		
		if(cPage != null) { 
			int p = Integer.parseInt(cPage);
			page.setNowPage(p);
			//이때!! 게시물을 추출할 범위(begin,end)그리고
			//시작페이지와 마지막페이지 값이 모두 구해진다.
		}else { //cPage라는 파라미터가 없이 호출되었을 때
			page.setNowPage(page.getNowPage());
			
		}
		
		//화면에 표현할 게시물들을 검출해 온다.
		NewsVO[] n_ar = NewsDAO.getList(page.getBegin(), page.getEnd());
		
		//뷰 페이지(flist.jsp)에서 표현할 자원들을
		//request에 저장한다.
		request.setAttribute("n_ar", n_ar);
		request.setAttribute("page", page);
		
		
		return "/nlist.jsp";
	}

}
