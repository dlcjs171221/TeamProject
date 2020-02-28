package wbs.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.WbsDAO;

import mybatis.vo.WbsVO;
import wbs.util.Paging;

public class MainAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		//페이징 처리를 위한 작업
		Paging page = new Paging(3, 3);
		
		
		//파라미터로 현재 페이지 값이 있는지 받아본다.
		String cPage = request.getParameter("cPage");
		
		if(cPage != null) {
			int p = Integer.parseInt(cPage);
			page.setNowPage(p);
			
		}else { //cPage라는 파라미터가 없이 호출되었을 때
			page.setNowPage(page.getNowPage()); // nowPage가 현재 1값으로 지정된다.
			
		}
		//메인화면에 표시할 게시물들을 검출
		//System.out.println(page.getNowPage());
		//System.out.println(page.getNumPerPage());
		//System.out.println(page.getBegin());
		//System.out.println(page.getEnd());
		WbsVO[] f_ar = WbsDAO.f_top3list();
		WbsVO[] a_ar = WbsDAO.a_top3list();
		WbsVO[] n_ar = WbsDAO.n_top3list();
		
		//request에 저장
		request.setAttribute("f_ar", f_ar);
		request.setAttribute("a_ar", a_ar);
		request.setAttribute("n_ar", n_ar);
	
		
		
		return "/main.jsp";
	}

}
