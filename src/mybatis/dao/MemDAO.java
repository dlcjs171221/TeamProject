package mybatis.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import mybatis.service.FactoryService;
import mybatis.vo.MemVO;

public class MemDAO {

	public static boolean addMem(String m_id, String m_pw, String m_name, String[] m_email,
			String[] m_phone) {
		boolean chk = false;
		
		String s_email = makeString(m_email,"@");
		String s_phone = makeString(m_phone,"-");  
		
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("m_id", m_id);
		map.put("m_pw", m_pw);
		map.put("m_name", m_name);
		map.put("m_email", s_email);
		map.put("m_phone", s_phone);
		
		SqlSession ss = FactoryService.getFactory().openSession();
		
		int cnt = ss.insert("mem.add", map);
		
		if(cnt > 0) {
			ss.commit();
			chk = true;
		}
		ss.close();
		
		return chk;
	}
	
	// 배열과 구분자를 인자로 받아서 하나의 문자열로
		//반환하는 기능
		private static String makeString(String[] ar, String delim) {
			StringBuffer sb = new StringBuffer();
			
			for(int i=0; i<ar.length; i++) {
				sb.append(ar[i]);
				
				if(i < ar.length-1)
					sb.append(delim);
			}
			return sb.toString();
		}
		
		//로그인
		public static MemVO login(String u_id, String u_pw) { //변수명을 한꺼번에 변경하고 싶을때 변경하고 싶은 변수명에 커서를 두고 마우스 오른쪽 클릭 refator->rename
			//맵퍼에 전달한 인자가 2개 이므로 Map으로 정의하자!
			Map<String, String> map = new HashMap<String, String>();
			map.put("id", u_id);
			map.put("pw", u_pw);
			
			SqlSession ss = FactoryService.getFactory().openSession();
			MemVO vo = ss.selectOne("mem.login", map);
			
			ss.close();
			
			return vo;
			
			
		}	
		
}
