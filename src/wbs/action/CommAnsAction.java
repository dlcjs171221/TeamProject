package wbs.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.WbsDAO;

public class CommAnsAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String writer = request.getParameter("writer");
		String content = request.getParameter("content");
		String ip = request.getRemoteAddr();
		String pw = request.getParameter("pwd");
		String b_idx = request.getParameter("b_idx");
		String cPage = request.getParameter("cPage");
		
		boolean bo = WbsDAO.addAns(writer, content, pw, b_idx, ip);
		if(bo == true) {
			request.setAttribute("ans", bo);
			
			return "/commok.jsp";
		}
		return "";
	}

}
