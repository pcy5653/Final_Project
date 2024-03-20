package com.cloud.pt.notice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.ListUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.cloud.pt.commons.FileManager;
import com.cloud.pt.commons.Pager;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class NoticeService {
	
	@Autowired
	private NoticeDAO noticeDAO;
	
	@Autowired
	private FileManager fileManager;
	
	//spEl
	@Value("${app.upload}")
	private String uploadPath;
	
	@Value("${app.upload.notice}")
	private String noticeName;
	
	
	public int setNoticeAdd(NoticeVO noticeVO, MultipartFile[] fileAdd)throws Exception{
		log.info("<============uploadPath:{}============>",uploadPath);
		int result = noticeDAO.setNoticeAdd(noticeVO);
		
		if(fileAdd != null) {//파일을 추가 안 했을 때
			for(MultipartFile multipartFile : fileAdd) {
				
				if(multipartFile.isEmpty()) {
					continue;
				}
				
				NoticeFileVO fileVO = new NoticeFileVO();
				String fileName = fileManager.save(this.uploadPath+this.noticeName, multipartFile);
				fileVO.setNoticeNum(noticeVO.getNoticeNum());
				fileVO.setFileName(fileName);
				fileVO.setOriName(multipartFile.getOriginalFilename());
				
				log.info("<============oriName:{}============>",fileVO.getOriName());
				result = noticeDAO.fileAdd(fileVO);
			}
		}
		return result;
	}
	
	public NoticeVO getNoticeDetail(NoticeVO noticeVO)throws Exception{
		int result = noticeDAO.setHitUpdate(noticeVO);
		noticeVO = noticeDAO.getNoticeDetail(noticeVO);
	
		return noticeVO;
	}
	
	//전체
	public List<NoticeVO> getNoticeList(Pager pager)throws Exception{
		pager.setPerPage(10L); //10개씩
		pager.makeRowNum(); //출력할 row 처음
		Long total = noticeDAO.getTotal(pager);//전체 데이타
		pager.makePageNum(total);//데이타수로 페이지 수	
		return noticeDAO.getNoticeList(pager);
	}
	
	//카테고리
	public List<NoticeVO> getCatList(NoticeVO noticeVO, Pager pager)throws Exception{
		pager.setPerPage(10L); //10개씩
		pager.makeRowNum(); //출력할 row 처음
		Long total = noticeDAO.getCatTotal(noticeVO);//전체 데이타
		pager.makePageNum(total);//데이타수로 페이지 수
		
		Map<String, Object> map = new HashMap<>();
		map.put("pager", pager);
		map.put("notice", noticeVO);
		
		return noticeDAO.getCatList(map);
	}
	
	public NoticeFileVO getFileDown(NoticeFileVO noticeFileVO)throws Exception{
		return noticeDAO.getFile(noticeFileVO);
	}
	
	public int setNoticeDelete(NoticeVO noticeVO)throws Exception{
		//파일 먼저 삭제
		List<NoticeFileVO> list = noticeDAO.getFileDelete(noticeVO);
		
		for(NoticeFileVO noticeFileVO:list) {//파일 리스트
			if(noticeFileVO == null) {
				continue;
			}
			
			fileManager.fileDelete(noticeFileVO, this.uploadPath+this.noticeName);
			
		}
		//db 삭제
		int result = noticeDAO.setNoticeDelete(noticeVO);
		
		return result;
	}
	
	public int FileUpdateDelete(NoticeFileVO noticeFileVO)throws Exception{
		//가져온 데이터로 폴더에서 삭제
		log.info("파일이름 : {}",noticeFileVO.getFileName());
		log.info("파일번호 : {}",noticeFileVO.getFileNum());
		fileManager.fileDelete(noticeFileVO, this.uploadPath+this.noticeName);
		
		int result = noticeDAO.FileUpdateDelete(noticeFileVO);//db 삭제
		
		return result;
	}
	
	public int setNoticeUpdate(NoticeVO noticeVO, MultipartFile[] fileAdd)throws Exception{
		log.info("{}",noticeVO.getCategory());
		log.info("{}",noticeVO.getTitle());
		log.info("{}",noticeVO.getContents());
		log.info("{}",noticeVO.getNoticeNum());
		//파일 먼저 추가
		int result = noticeDAO.setNoticeUpdate(noticeVO);
		
		if(result==0) {
			return result;//db 저장 실패
		}
			
		if(fileAdd != null) {//파일을 추가 안 했을 때
			
			for(MultipartFile multipartFile : fileAdd) {
				
				
				if(multipartFile.isEmpty()) {
					continue;
				}
				
				NoticeFileVO fileVO = new NoticeFileVO();
				String fileName = fileManager.save(this.uploadPath+this.noticeName, multipartFile);
				fileVO.setNoticeNum(noticeVO.getNoticeNum());
				fileVO.setFileName(fileName);
				fileVO.setOriName(multipartFile.getOriginalFilename());
				
				log.info("<============oriName:{}============>",fileVO.getOriName());
				result = noticeDAO.fileAdd(fileVO);
			}
		}
		
		return result;
	}
	
	public List<NoticeVO> getPinList()throws Exception{
		return noticeDAO.getPinList();
	}
}
