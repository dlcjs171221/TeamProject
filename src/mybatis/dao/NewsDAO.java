package mybatis.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import mybatis.service.FactoryService;
import mybatis.vo.AnnVO;
import mybatis.vo.NewsVO;

public class NewsDAO {

	//전체 게시물의 수를 반환하는 기능
		public static int getTotalCount() {
			SqlSession ss = FactoryService.getFactory().openSession();
			
			int cnt = ss.selectOne("news.totalCount");
			
			ss.close();
			
			return cnt;
		}
		
		//원하는 페이지의 게시물들을 목록화면으로
		//표현하기 위해 배열로 반환하는 기능
		public static NewsVO[] getList(int begin, int end) {
			NewsVO[] ar = null;
			
			SqlSession ss = FactoryService.getFactory().openSession();
			
			Map<String, Integer> map = new HashMap<String, Integer>();
			
			map.put("begin", begin);
			map.put("end", end);
			
			List<NewsVO> list = ss.selectList("news.newslist", map);
			
			if(list != null) {
				ar = new NewsVO[list.size()];
				
				list.toArray(ar);
				
				ss.close();
			}
			return ar;
		}
		
		//b_idx값을 인자로 받아서 bbs.getBbs라는 멥퍼를 호출하는 기능
			//즉, 보기 기능에서 호출되는 함수이며 특정 게시물 정보를
			//반환해야 한다. - view.jsp
		public static NewsVO getAnn(String n_idx) {
			
			SqlSession ss = FactoryService.getFactory().openSession();
			
			NewsVO vo = ss.selectOne("news.getNews", n_idx);
			ss.close();
			
			return vo;
			
		}
		
		//원글 저장기능
		public static boolean addNews(String subject, String writer, String content,
				String f_name, String o_name, String ip) {
			boolean chk = false;
			
			Map<String, String> map = new HashMap<String, String>();
			map.put("subject", subject);
			map.put("writer", writer);
			map.put("content", content);
			map.put("file_name", f_name);
			map.put("ori_name", o_name);
			map.put("pwd", "1234");
			map.put("ip", ip);
			map.put("hit", "0");
			map.put("status","0");
			
			SqlSession ss = FactoryService.getFactory().openSession();
			
			int cnt = ss.insert("news.add", map);
			
			if(cnt > 0) {
				chk = true;
				ss.commit();
			}
			ss.close();
			
			return chk;
		}
		
		public static boolean addNews( String writer, String content, String pwd,
				String n_idx, String ip) {
			
			boolean chk = false;
			
			Map<String, String> map = new HashMap<String, String>();
			
			map.put("writer",writer);
			map.put("content",content);
			map.put("pwd",pwd);
			map.put("n_idx",n_idx);
			map.put("ip",ip);
			
			SqlSession ss = FactoryService.getFactory().openSession();
			
			int cnt = ss.insert("news.add_ans",map);
			
			if(cnt>0) {
				ss.commit();
				chk=true;
			}else
				ss.rollback();
			
			ss.close();
			return chk;
		}
		
		//원글 수정기능
		public static boolean edit(String n_idx, String subject, String writer, String content,
				String f_name, String o_name, String ip, String pwd) {
			
			boolean chk = false;
			Map<String, String> map = new HashMap<String, String>();
			
			map.put("n_idx",n_idx);
			map.put("subject",subject);
			map.put("writer",writer);
			map.put("content",content);
			map.put("ip",ip);
			map.put("pwd",pwd);
			
			if(f_name != null && f_name.trim().length() > 0) {
				map.put("fname",f_name);
				map.put("oname",o_name);
			}
			
			SqlSession ss = FactoryService.getFactory().openSession();
			
			int cnt = ss.update("news.edit",map);
			
			if(cnt > 0) {
				ss.commit();
				chk = true;
			}
			ss.close();
			
			return chk;
					
		}
		
		//인자로 삭제할 원글의 b_idx와 pw를 받아 처리하는 기능 (원글 삭제)
		
		public static boolean delNews(String n_idx,String pw) {
			Boolean chk = false;
			
			Map<String, String> map = new HashMap<String, String>();
			
			map.put("n_idx", n_idx);
			map.put("pwd", pw);
			
			SqlSession ss = FactoryService.getFactory().openSession();
			
			int cnt = ss.update("news.del", map);
			if(cnt>0) {
				ss.commit();
				chk = true;
			}else 
				ss.rollback();
			
			ss.close();
			
			return chk;
		}
		
		
		//인자로 받은 f_idx의 게시물 hit을 증가하는 기능
		public static void hit(String n_idx) {
			
			SqlSession ss = FactoryService.getFactory().openSession();
			
			int cnt = ss.update("news.hit",n_idx);
			if(cnt > 0) 
				ss.commit();
			else 
				ss.rollback();
			ss.close();
		}
}
