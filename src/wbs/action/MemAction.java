package wbs.action;

import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.MemDAO;

public class MemAction implements Action{
	// 회원가입 
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String id = request.getParameter("m_id");
		String pw = request.getParameter("m_pw");
		String name = request.getParameter("m_name");
		String[] email = request.getParameterValues("m_email");
		String[] phone = request.getParameterValues("m_phone");
		
		boolean bo = MemDAO.addMem(id, pw, name, email, phone);
		
		if(bo==true) {
		
		
		request.setAttribute("add_mem", bo);
		
		return "/memok.jsp";
		}
		
		return	"";
	}

}