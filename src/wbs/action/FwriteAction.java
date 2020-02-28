package wbs.action;

import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import mybatis.dao.WbsDAO;

public class FwriteAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		//현재 메서드는 flist.jsp에 있는 [글쓰기]버튼을 클릭했을 때와
		//fwrite.jsp에서 [보내기]버튼을 클릭했을 때 호출된다.
		
		String c_type = request.getContentType();
		
		String viewPath = "/wbs_fwrite.jsp";
		
		if(c_type != null && c_type.startsWith("multipart/")) { //보내기버튼 클릭
			try {
				//첨부파일을 저장할 위치를 절대경로화 시킨다.
				ServletContext application = request.getServletContext();
				
				String path = application.getRealPath("/upload");
				
				MultipartRequest mr = new MultipartRequest(request, path, 1024*1024*5,
						"utf-8", new DefaultFileRenamePolicy());
				
				//나머지 파라미터들 받기
				String b_name = "자유";
				String subject = mr.getParameter("title");
				String writer = mr.getParameter("writer");
				String content = mr.getParameter("content");
				String ip = request.getRemoteAddr();
				
				//파일이 첨부되었는지?
				File f = mr.getFile("file");
				
				String f_name = "";
				String o_name = "";
				
				if(f != null) {
					//실제 첨부할 때 파일명과 올라갈 때 이름을 얻는다.
					o_name = mr.getOriginalFileName("file");
					f_name = f.getName();
					
				}
				//dao호출하여 받은 값들 전달!
				WbsDAO.add(b_name, subject, writer, content, f_name, o_name, ip);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			//JSP경로를 반환하면 forward되도록 되어 있어서
			//f5 즉, 화면 갱신을 하면 저장된 정보가 계속 저장된다.
			//type= write와 파라미터들 그대로 저장해서 간다.
			viewPath = null;
			
		} //if문의 끝
		
		return viewPath;
	}

}




