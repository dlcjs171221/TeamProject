package wbs.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mybatis.dao.MemDAO;
import mybatis.dao.WbsDAO;


public class NdeleteAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		
		String c_type = request.getContentType();
		String viewPath = null;
		
		
		if(c_type == null) { // GET방식으로 요청된 경우
			
			viewPath = "/control.jsp";
			
		}else if(c_type != null && c_type.startsWith("application/")) {
			// login.jsp에서 POST방식(form)으로 로그인 요청된 경우
			String idx = (String) request.getAttribute("b_idx");
			
			String pw = (String) request.getAttribute("pw");
			
			boolean chk = MemDAO.del(idx, pw);

			if(!chk) // 회원정보가 있으면
				WbsDAO.del(idx,pw);
		
		}
		
		return viewPath;
	}

}
