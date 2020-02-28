package wbs.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.MemDAO;

public class InfoEditokAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// 수정화면
		String id = request.getParameter("m_id");
		String name = request.getParameter("m_name");
		String[] email = request.getParameterValues("m_email");
		String[] phone = request.getParameterValues("m_phone");
		
		
		boolean bo = MemDAO.edit(id,name, email, phone);
		
		if(bo==true) {
			request.setAttribute("mem_edit", bo);
			
			return "/editok.jsp";
		}
		
		return "";
	}

}
