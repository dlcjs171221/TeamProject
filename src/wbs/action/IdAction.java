package wbs.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.MemDAO;
import mybatis.vo.MemVO;

public class IdAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// 아이디 유무
		String id = request.getParameter("m_id");
		
		MemVO vo = MemDAO.getMember(id);
		
		if(vo != null)
			request.setAttribute("vo_id", id);
		
		
		return "/idCheck.jsp";
	}

}
