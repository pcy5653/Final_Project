package com.cloud.pt.notice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.cloud.pt.commons.Pager;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/notice/*")
@Slf4j
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	@GetMapping("add")
	public String setNoticeAdd()throws Exception{
		return "notice/add";
	}
	
	@PostMapping("add")
	public String setNoticeAdd(MultipartFile [] fileAdd, NoticeVO noticeVO)throws Exception{
		SecurityContext context = SecurityContextHolder.getContext();
		org.springframework.security.core.Authentication b = context.getAuthentication();
		noticeVO.setEmployeeNum(Long.valueOf(b.getName()));
		
		noticeService.setNoticeAdd(noticeVO, fileAdd);
	
		return "redirect:./list";
	}
	
	@GetMapping("list")
	public String getNoticeList(Model model, Pager pager)throws Exception{
		List<NoticeVO> list =noticeService.getNoticeList(pager);
		List<NoticeVO> pinList=noticeService.getPinList();
		model.addAttribute("list", list);
		model.addAttribute("pager", pager);
		model.addAttribute("pinList", pinList);
		
		return "notice/list";
	}
	
	@GetMapping("detail")
	public String getNoticeDetail(Model model, NoticeVO noticeVO)throws Exception{
		noticeVO = noticeService.getNoticeDetail(noticeVO);
		model.addAttribute("notice", noticeVO);
		
		return "notice/detail";
	}
	
	@GetMapping("noticefiledown")
	public String getFileDown(Model model, NoticeFileVO noticeFileVO)throws Exception{
		
		noticeFileVO=noticeService.getFileDown(noticeFileVO);
		model.addAttribute("fileVO", noticeFileVO);
		
		String result = "0";
		if(noticeFileVO != null) {
			result = "1";
		}
		
		return "fileManager";// 이것도 꼭 해줘야함
	}
	
	@PostMapping("delete")
	public String setNoticeDelete(NoticeVO noticeVO)throws Exception{
		int result = noticeService.setNoticeDelete(noticeVO);
		
		if(result>0){
			log.info("삭제 성공");
		}else {
			log.info("삭제 실패");
		}
		
		return "redirect:./list";
	}
	
	@GetMapping("update")
	public String setNoticeUpdate(Model model, NoticeVO noticeVO)throws Exception{
		//db 정보를 가져옴
		noticeVO = noticeService.getNoticeDetail(noticeVO);
		
		model.addAttribute("notice", noticeVO);
		model.addAttribute("size", noticeVO.getList().size());
		
		return "notice/update";
	}
	
	@PostMapping("update")
	public String setNoticeUpdate(NoticeVO noticeVO, MultipartFile [] fileAdd)throws Exception{
		SecurityContext context = SecurityContextHolder.getContext();
		org.springframework.security.core.Authentication b = context.getAuthentication();
		
		log.info("수정내용: {}",noticeVO.getContents());
		if(noticeVO.getEmployeeNum()==Long.parseLong(b.getName())) {//작성자와 같을때
			
			int result = noticeService.setNoticeUpdate(noticeVO, fileAdd);
			
			if(result>0){
				log.info("업데이트 성공");
			}else {
				log.info("업데이트 실패");
			}
		}
		return "redirect:./detail?noticeNum="+noticeVO.getNoticeNum();
	}
	
	@PostMapping("filedelete")
	public String fileUpdateDelete(Model model, NoticeFileVO noticeFileVO)throws Exception{
		
		int result = noticeService.FileUpdateDelete(noticeFileVO);
		
		if(result>0){
			log.info("파일삭제 성공");
		}else {
			log.info("파일삭제 실패");
		}
		model.addAttribute("result", result);
		
		return "commons/ajaxResult";
	}
	
	@GetMapping("totallist")
	public String getTotalList(Model model,Pager pager)throws Exception{
		List<NoticeVO> list =noticeService.getNoticeList(pager);
		List<NoticeVO> pinList=noticeService.getPinList();
		model.addAttribute("list", list);
		model.addAttribute("pager", pager);
		model.addAttribute("pinList", pinList);
		
		return "notice/listResult";
	}
	
	@GetMapping("categorylist")
	public String getCatList(Model model,Pager pager, NoticeVO noticeVO)throws Exception{
		List<NoticeVO> list =noticeService.getCatList(noticeVO, pager);
		
		model.addAttribute("list", list);
		model.addAttribute("pager", pager);
		
		return "notice/listResult2";
	}

}
