package com.cloud.pt.machine;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.cloud.pt.employee.EmployeeVO;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("/machine/*")
@Controller
@Slf4j
public class MachineController {

	@Autowired
	private MachineService machineService;
	
	
	@GetMapping("list")
	public void getList(MachineVO machineVO, Model model)throws Exception{
	
		List<MachineVO> ar = machineService.getList(machineVO);
		model.addAttribute("list", ar);
	}
	
	
	@GetMapping("add")
	public void setMachineAdd(MachineVO machineVO)throws Exception{
		
	}	
	@PostMapping("add")
	public String setMachineAdd(MachineVO machineVO, MultipartFile mFile, Model model)throws Exception{
		
		int result = machineService.setMachineAdd(machineVO, mFile);
		
		return "redirect:/machine/list";
		
	}
	
	
	@PostMapping("delete")
	public ResponseEntity<Map<String, Object>> setMachineDelete(@RequestBody List<String> machineNums, Model model)throws Exception{
		
		log.info("parameter : {}", machineNums);

		List<Integer> machineNumInts = new ArrayList<>();
	    for (String machineNum : machineNums) {
	        try {
	            // Integer.parseInt()를 사용하여 String을 Integer로 변환
	        	
	            int num = Integer.parseInt(machineNum);
	            log.info("데이터들 : {}", num);
	            machineNumInts.add(num);
	            
	        } catch (NumberFormatException e) {
	            // 유효한 정수로 변환할 수 없는 경우에 대한 처리
	            log.warn("Invalid machineNum: {}", machineNum);
	        }
	    }
	    int result = machineService.setMachineDelete(machineNumInts);
	    
	    Map<String, Object> response = new HashMap<>();
	    response.put("result", result); // 성공 여부 또는 에러 코드
	    response.put("message", "삭제가 되었습니다."); // 성공 메시지 또는 에러 메시지
	    
	    return ResponseEntity.ok(response);
	}
}
