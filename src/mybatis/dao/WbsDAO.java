package mybatis.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.swing.text.StyledEditorKit.BoldAction;

import org.apache.ibatis.jdbc.SQL;
import org.apache.ibatis.session.SqlSession;

import mybatis.service.FactoryService;

import mybatis.vo.WbsVO;
import mybatis.vo.WcommVO;

public class WbsDAO {

	//전체 게시물의 수를 반환하는 기능
	public static int getFTotalCount() {
		SqlSession ss = FactoryService.getFactory().openSession();
		
		int cnt = ss.selectOne("wbs.f_totalCount");
		
		ss.close();
		
		return cnt;
	}
	
	public static int getATotalCount() {
		SqlSession ss = FactoryService.getFactory().openSession();
		
		int cnt = ss.selectOne("wbs.a_totalCount");
		
		ss.close();
		
		return cnt;
	}
	
	public static int getNTotalCount() {
		SqlSession ss = FactoryService.getFactory().openSession();
		
		int cnt = ss.selectOne("wbs.n_totalCount");
		
		ss.close();
		
		return cnt;
	}
	
	//원하는 페이지의 게시물들을 목록화면으로
	//표현하기 위해 배열로 반환하는 기능
	public static WbsVO[] get_Flist(int begin, int end) {
		WbsVO[] ar = null;
		
		SqlSession ss = FactoryService.getFactory().openSession();
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("begin", begin);
		map.put("end", end);
		
		List<WbsVO> list = ss.selectList("wbs.wbs_flist", map);
		
		if(list != null) {
			ar = new WbsVO[list.size()];
			
			list.toArray(ar);
			
			ss.close();
		}
		return ar;
	}
	
	public static WbsVO[] get_Alist(int begin, int end) {
		WbsVO[] ar = null;
		
		SqlSession ss = FactoryService.getFactory().openSession();
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("begin", begin);
		map.put("end", end);
		
		List<WbsVO> list = ss.selectList("wbs.wbs_alist", map);
		
		if(list != null) {
			ar = new WbsVO[list.size()];
			
			list.toArray(ar);
			
			ss.close();
		}
		return ar;
	}
	
	public static WbsVO[] get_Nlist(int begin, int end) {
		WbsVO[] ar = null;
		
		SqlSession ss = FactoryService.getFactory().openSession();
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("begin", begin);
		map.put("end", end);
		
		List<WbsVO> list = ss.selectList("wbs.wbs_nlist", map);
		
		if(list != null) {
			ar = new WbsVO[list.size()];
			
			list.toArray(ar);
			
			ss.close();
		}
		return ar;
	}
	
	//메인화면 top3리스트 보여주는 기능
	
	public static WbsVO[] f_top3list() {
		WbsVO[] ar = null;
		
		SqlSession ss = FactoryService.getFactory().openSession();
		
		List<WbsVO> list = ss.selectList("wbs.wbs_top3flist");
		
		if(list != null) {
			ar = new WbsVO[list.size()];
			
			list.toArray(ar);
			
			ss.close();
		}
		
		return ar;
	}
	
	public static WbsVO[] a_top3list() {
		WbsVO[] ar = null;
		
		SqlSession ss = FactoryService.getFactory().openSession();
		
		List<WbsVO> list = ss.selectList("wbs.wbs_top3alist");
		
		if(list != null) {
			ar = new WbsVO[list.size()];
			
			list.toArray(ar);
			
			ss.close();
		}
		
		return ar;
	}
	
	public static WbsVO[] n_top3list() {
		WbsVO[] ar = null;
		
		SqlSession ss = FactoryService.getFactory().openSession();
		
		List<WbsVO> list = ss.selectList("wbs.wbs_top3nlist");
		
		if(list != null) {
			ar = new WbsVO[list.size()];
			
			list.toArray(ar);
			
			ss.close();
		}
		
		return ar;
	}
	
	//b_idx값을 인자로 받아서 bbs.getBbs라는 멥퍼를 호출하는 기능
		//즉, 보기 기능에서 호출되는 함수이며 특정 게시물 정보를
		//반환해야 한다. - view.jsp
	public static WbsVO getWbs(String b_idx) {
		
		SqlSession ss = FactoryService.getFactory().openSession();
		
		WbsVO vo = ss.selectOne("wbs.getWbs", b_idx);
		ss.close();
		
		return vo;
		
	}
	
	//원글 저장기능
	public static boolean add(String b_name, String subject, String writer, String content,
			String f_name, String o_name, String ip) {
		boolean chk = false;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("b_name", b_name);
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
		
		int cnt = ss.insert("wbs.add", map);
		
		if(cnt > 0) {
			chk = true;
			ss.commit();
		}
		ss.close();
		
		return chk;
	}
	
	public static boolean addAns( String writer, String content, String pwd,
			String b_idx, String ip) {
		
		boolean chk = false;
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("writer",writer);
		map.put("content",content);
		map.put("pwd",pwd);
		map.put("b_idx",b_idx);
		map.put("ip",ip);
		
		SqlSession ss = FactoryService.getFactory().openSession();
		
		int cnt = ss.insert("wbs.add_ans",map);
		
		if(cnt>0) {
			ss.commit();
			chk=true;
		}else
			ss.rollback();
		
		ss.close();
		return chk;
	}
	
	//원글 수정기능
	public static boolean edit(String b_idx, String subject, String writer, String content,
			String f_name, String o_name, String ip, String pwd) {
		
		boolean chk = false;
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("b_idx",b_idx);
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
		
		int cnt = ss.update("wbs.edit",map);
		
		if(cnt > 0) {
			ss.commit();
			chk = true;
		}
		ss.close();
		
		return chk;
				
	}
	
	//인자로 삭제할 원글의 b_idx와 pw를 받아 처리하는 기능 (원글 삭제)
	
	public static boolean del(String b_idx,String pw) {
		Boolean chk = false;
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("b_idx", b_idx);
		map.put("pwd", pw);
		
		SqlSession ss = FactoryService.getFactory().openSession();
		
		int cnt = ss.update("wbs.del", map);
		if(cnt>0) {
			ss.commit();
			chk = true;
		}else 
			ss.rollback();
		
		ss.close();
		
		return chk;
	}
	
	
	//인자로 받은 b_idx의 게시물 hit을 증가하는 기능
	public static boolean hit(String b_idx) {
		
		boolean chk = false;
		
		SqlSession ss = FactoryService.getFactory().openSession();
		
		int cnt = ss.update("wbs.hit",b_idx);
		
		if(cnt > 0) {
			
			chk = true;
			
			ss.commit();
		
		}
		ss.close();
	
		return chk;
	}
	
	// 댓글 삭제
			public static boolean commdel(String idx) {
		 		boolean chk = false;
		 		
		 		SqlSession ss = FactoryService.getFactory().openSession();
		 		
		 		int cnt = ss.delete("wbs.commdel",idx);
		 		
		 		if(cnt>0) {
		 			chk = true;
		 			ss.commit();
		 		}
		 		ss.close();
		 		return chk;
	 	}
	// 댓글 목록들
		public static WcommVO[] viewComm(String b_idx) {
			WcommVO[] ar = null;
			SqlSession ss = FactoryService.getFactory().openSession();
			
			java.util.List<WcommVO> list = ss.selectList("wbs.wcommlist", b_idx);
			
			if(list != null) {
				ar = new WcommVO[list.size()];
				list.toArray(ar);
			}
			
			return ar;
		}

}
















