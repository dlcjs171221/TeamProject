package wbs.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mybatis.dao.MemDAO;
import mybatis.dao.WbsDAO;
import mybatis.vo.MemVO;

public class FdeleteAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		
		String idx = request.getParameter("b_idx");
			
		String pw = request.getParameter("pw");
			
		boolean chk = MemDAO.del(idx, pw);
		
		request.setAttribute("chk", chk);

		return "/fdel_ok.jsp";
	}

}
