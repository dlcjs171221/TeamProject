package wbs.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.MemDAO;

public class DelAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String id = request.getParameter("m_id");
		String pw = request.getParameter("m_pw");
		
		boolean vo = MemDAO.del(id, pw);
		
		if(vo==true) {
			
			request.setAttribute("memdel", vo);
			return "/memdelok.jsp";
		}
		
		return "";
	}

}
