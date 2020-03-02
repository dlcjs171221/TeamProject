package wbs.action;

import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import mybatis.dao.WbsDAO;
import mybatis.vo.WbsVO;

public class FeditAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// 요청한 contentType을 얻어낸다.
			String c_type = request.getContentType();
			String viewPath = null;
			
			if(c_type.startsWith("application")) {
				//POST방식으로 요청된 경우!
				String b_idx = request.getParameter("b_idx");
				WbsVO vo = WbsDAO.getWbs(b_idx);
				if(vo != null)
					request.setAttribute("vo", vo);
				
				viewPath = "/wbs_fedit.jsp";
			}else if(c_type.startsWith("multipart/")) {
				// 첨부파일을 저장할 위치를 절대경로화 시킨다.
				ServletContext application = request.getServletContext();
				
				try {
					String path = application.getRealPath("/upload");
					
					MultipartRequest mr = new MultipartRequest(
						request, path, 1024*1024*5, "utf-8",
						new DefaultFileRenamePolicy());
					// 이때 첨부파일이 업로도 된다.
					
					//나머지 파라미터들 받기
					String b_idx = mr.getParameter("b_idx");
					String cPage = mr.getParameter("cPage");
					String subject = mr.getParameter("title");
					String writer = mr.getParameter("writer");
					String content = mr.getParameter("content");
					String pwd = mr.getParameter("pwd");
					
					//첨부파일의 이름을 확인하기 위해 File객체 얻기
					File f = mr.getFile("file");
					
					String fname = "";
					String oname = "";
					if(f != null) {
						fname = f.getName();
						oname = mr.getOriginalFileName("file");
					}
					
					String ip = request.getRemoteAddr();
					
					WbsDAO.edit(b_idx, subject, writer, 
						content, fname, oname, ip, pwd);
					
					viewPath = "control?type=fview&cPage="+cPage+
							"&b_idx="+b_idx;
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
			
			return viewPath;
	}

}
