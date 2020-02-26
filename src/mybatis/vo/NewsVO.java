package mybatis.vo;

import java.util.List;

public class NewsVO {

	String f_idx,
	subject,
	writer,
	content,
	file_name,
	ori_name,
	pwd,
	write_date,
	ip,
	hit,
	status;
List<NCommVO> n_list;



public List<NCommVO> getN_list() {
	return n_list;
}

public void setN_list(List<NCommVO> n_list) {
	this.n_list = n_list;
}

public String getF_idx() {
return f_idx;
}

public void setF_idx(String f_idx) {
this.f_idx = f_idx;
}

public String getSubject() {
return subject;
}

public void setSubject(String subject) {
this.subject = subject;
}

public String getWriter() {
return writer;
}

public void setWriter(String writer) {
this.writer = writer;
}

public String getContent() {
return content;
}

public void setContent(String content) {
this.content = content;
}

public String getFile_name() {
return file_name;
}

public void setFile_name(String file_name) {
this.file_name = file_name;
}

public String getOri_name() {
return ori_name;
}

public void setOri_name(String ori_name) {
this.ori_name = ori_name;
}

public String getPwd() {
return pwd;
}

public void setPwd(String pwd) {
this.pwd = pwd;
}

public String getWrite_date() {
return write_date;
}

public void setWrite_date(String write_date) {
this.write_date = write_date;
}

public String getIp() {
return ip;
}

public void setIp(String ip) {
this.ip = ip;
}

public String getHit() {
return hit;
}

public void setHit(String hit) {
this.hit = hit;
}

public String getStatus() {
return status;
}

public void setStatus(String status) {
this.status = status;
}
}
