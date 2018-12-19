package com.spring.view.Admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spring.trip.admin.AdminService;
import com.spring.trip.admin.AdminVO;
import com.spring.view.Board.BoardController;
import com.spring.view.Member.MemberController;

@Controller
//"board"라는 이름의 Model이 있으면 session에 저장
@SessionAttributes("admin")
public class AdminController {
	@Autowired
	private AdminService adminService;

	@RequestMapping("/getAdmin.do")
	public String getAdmin(AdminVO vo, Model model) {
		System.out.println(">>> 관리자 정보 조회 요청 처리(getAdmin)");
		
		//Model 형식으로 저장해서 DispatcherServlet에 전달
		//model.addAttribute(attributeName, attributeValue)
		vo.setA_idx(1);
		System.out.println("null이니? : "+adminService.getAdmin(vo));
		model.addAttribute("admin", adminService.getAdmin(vo));
		
		return "admin_CRUD_test.jsp";
	}	
	@RequestMapping("/getAdminList.do")
	public String getAdminList(Model model) {
		System.out.println(">>> 전체 글 조회 요청 처리(getAdminList)");
		
		//Model 형식으로 저장해서 DispatcherServlet에 전달
		//model.addAttribute(attributeName, attributeValue)
		System.out.println("null이니? : "+adminService.getAdminList());
		model.addAttribute("AdminList", adminService.getAdminList());
		
		return "admin_CRUD_test.jsp";
	}
	
	@RequestMapping("/insertAdmin.do")
	public String insertAdmin(AdminVO vo) {
		System.out.println(">>> 글 등록 요청 처리(insertAdmin)");
		
		//전달받은 파라미터값을 사용해서 입력처리
		//스프링에서 파라미터값을 BoardVO 타입의 객체에 입력하고 vo변수에 주입
		adminService.insertAdmin(vo);
		
		return "getAdminList.do";
	}
	
	@RequestMapping("/updateAdmin.do")
	public String updateBoard(AdminVO vo) {
		System.out.println(">>> 글 수정 요청 처리(updateAdmin)");
		
		//전달받은 파라미터값을 사용해서 입력처리
		//스프링에서 파라미터값을 BoardVO 타입의 객체에 입력하고 vo변수에 주입
		adminService.updateAdmin(vo);

		return "getAdminList.do";
	}
	
	@RequestMapping("/deleteAdmin.do")
	public String deleteBoard(AdminVO vo) {
		System.out.println(">>> 글 삭제 요청 처리(deleteAdmin)");
		
		//전달받은 파라미터값을 사용해서 입력처리
		//스프링에서 파라미터값을 BoardVO 타입의 객체에 입력하고 vo변수에 주입
		adminService.deleteAdmin(vo);

		return "getAdminList.do";
	}
	
	@RequestMapping("/adminPage.do")
	public String getAdminPage(Model model) {
		System.out.println(">>> adminPage로 고고씽");
		
		//전체 회원수
		int clientsCnt = adminService.allClients();
		model.addAttribute("cilentsCnt", clientsCnt);
		System.out.println("cilentsCnt : " + clientsCnt);
		
		//전체 게시글 수
		int boardsCnt = adminService.allBoards();
		model.addAttribute("boardsCnt", boardsCnt);
		System.out.println("boardsCnt : " + boardsCnt);
		
		//전체 등록된 나라 수
		int contriesCnt = adminService.allCountries();
		model.addAttribute("contriesCnt", contriesCnt);
		System.out.println("contriesCnt : " + contriesCnt);
		
		return "adminPage.jsp";
	}
	

	
}
