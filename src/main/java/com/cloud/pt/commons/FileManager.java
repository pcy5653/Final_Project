package com.cloud.pt.commons;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.view.AbstractView;

import com.cloud.pt.notice.NoticeFileVO;

import lombok.extern.slf4j.Slf4j;

import com.cloud.pt.employee.EmployeeVO;

@Slf4j
@Component
public class FileManager extends AbstractView{
	
	@Value("${app.upload}")
	private String uploadPath;
	
	@Value("${app.upload.notice}")
	private String noticeName;
	
		
	// file 저장 후, 파일명 리턴
	public String save (String path, MultipartFile multipartFile)throws Exception{
		// 어떤 파일을 어디에 저장할지 설정!
		
		// 1. 파일 객체생성
		File file = new File(path);

		if(!file.exists()) {
			file.mkdirs();
		}
		

		// 2. 저장할 파일명
		String fileName = UUID.randomUUID().toString()+"_"+multipartFile.getOriginalFilename();
		
		// 3. 파일 저장
		file = new File(file, fileName);

		multipartFile.transferTo(file);
		
		return fileName;
	}
	
	
	// infoUpdate시 fileDelete
	public boolean fileDelete(String path, EmployeeVO employeeVO)throws Exception{
		// 1. file에 '삭제할 파일경로'(1)과 fileName 넣기
		File file = new File(path, employeeVO.getProFile());
				
		return file.delete();
	}

	@Override // notice file down
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		NoticeFileVO noticeFileVO = (NoticeFileVO)model.get("fileVO"); //"CustomView의 bean name"
		 log.info("--------------------------------");
		 log.info("FILEVO {} ", noticeFileVO);
		 
		 File file = new File(this.uploadPath+this.noticeName, noticeFileVO.getFileName());
		 
		 //한글 처리
		 response.setCharacterEncoding("UTF-8");
		 
		 //총 파일의 크기
		 response.setContentLengthLong(file.length());
		 
		 //다운로드시 파일의 이름을 인코딩
		 String oriName = URLEncoder.encode(noticeFileVO.getOriName(), "UTF-8");
		 
		 //header 설정
		 response.setHeader("Content-Disposition", "attachment;filename=\""+oriName+"\"");
		 response.setHeader("Content-Transfer-Encoding", "binary");
		 
		 //HDD에서 파일을 읽고
		 FileInputStream fi = new FileInputStream(file);
		 //Client 로 전송 준비
		 OutputStream os = response.getOutputStream();
		 
		 //전송
		 FileCopyUtils.copy(fi, os);
		 
		 //자원 해제
		 os.close();
		 fi.close();
		
	}
	
	//notice 파일 삭제
	public boolean fileDelete(NoticeFileVO noticeFileVO, String path) {
	    // 1. 삭제할 폴더의 실제 경로
	    //path = session.getServletContext().getRealPath(path);
		
		log.info(path);
		log.info(noticeFileVO.getFileName());
	    File file = new File(path, noticeFileVO.getFileName());

	    // 로그 추가 File에 입력된 절대 경로 리턴
	    log.info("Deleting file:{} ",file.getAbsolutePath());

	    return file.delete();
	}

	
}

