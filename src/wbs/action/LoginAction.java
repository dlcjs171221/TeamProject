package wbs.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.descriptor.web.ContextTransaction;

import mybatis.dao.MemDAO;
import mybatis.vo.MemVO;

public class LoginAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		// 로그인 여부 판단을 위해 요청한 ContentType()을 얻어낸다.
		String c_type = request.getContentType();
		String viewPath = null;
		
		
		if(c_type == null) { // GET방식으로 요청된 경우
			
			viewPath = "/login.jsp";
			
		}else if(c_type != null && c_type.startsWith("application/")) {
			// login.jsp에서 POST방식(form)으로 로그인 요청된 경우
			String m_id = request.getParameter("id");
			String m_pw = request.getParameter("pw");
			
			MemVO vo = MemDAO.login(m_id, m_pw);
			
			HttpSession session = request.getSession();
			if(vo != null) // 회원정보가 있으면
				session.setAttribute("vo", vo);
			
			
		}
		
		
		
		return viewPath;
	}

}
