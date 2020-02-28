package wbs.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.WbsDAO;

public class AnsdelAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String pw = request.getParameter("pw");
		String c_idx = request.getParameter("c_idx");
		
		boolean bo = WbsDAO.commdel(c_idx);
		
		if(bo == true) {
			request.setAttribute("ansdel", bo);
			
			return "/ansdelok.jsp";
		}
		
		return null;
	}

}
