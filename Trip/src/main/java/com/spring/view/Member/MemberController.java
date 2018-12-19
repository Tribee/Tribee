package com.spring.view.Member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.fasterxml.jackson.databind.JsonNode;
import com.spring.trip.member.MemberService;
import com.spring.trip.member.MemberVO;
import com.spring.trip.member.impl.MemberServiceImpl;

@Controller
// "board"라는 이름의 Model이 있으면 session에 저장
//@SessionAttributes("member")
public class MemberController {
	@Autowired
	private MemberService memberService;

	// 회원 조회
	@RequestMapping("/getMemberList.do")
	public String getMemberList(MemberVO vo, Model model) {
		System.out.println("MemberController >>> 회원 상세 조회 요청 처리(getMember)");

		// Model 형식으로 저장해서 DispatcherServlet에 전달
		// model.addAttribute(attributeName, attributeValue)
		vo.setM_idx(1);
		System.out.println("null이니? : " + memberService.getMemberList(vo));
		model.addAttribute("member", memberService.getMemberList(vo));

		return "member.jsp";
	}


	// 회원 가입
	@RequestMapping(value = "/insertMember.do", method = RequestMethod.POST)
	public String insertMember(MemberVO vo, Model model, HttpSession session) {
		// if(vo.getId() == null || vo.getId().equals("")) {
		// return "Trip.jsp";
		// }
		System.out.println("MemberController >>>> 회원 가입 요청 처리(insertMember)");
		System.out.println("insertMember vo : " + vo);

		memberService.insertMember(vo);

		return "main.jsp";

	}

	// 회원 가입 ID 중복 체크
	@RequestMapping(value = "/idDuplChk.do", method = RequestMethod.POST)
	public @ResponseBody String idDuplChk(@ModelAttribute("vo") MemberVO vo, Model model) throws Exception {

		int result = memberService.idDuplChk(vo.getId());
		System.out.println("중복 체크 controller : " + result);
		return String.valueOf(result);
	}

	// 회원 가입 닉네임 중복 체크
	@RequestMapping(value = "/nickDuplChk.do", method = RequestMethod.POST)
	public @ResponseBody String nickDuplChk(@ModelAttribute("vo") MemberVO vo, Model model) throws Exception {
		int result = memberService.nickDuplChk(vo.getNick_name());
		System.out.println("중복 체크 controller : " + result);
		return String.valueOf(result);
	}

	// 로그인
	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public String login(MemberVO vo, MemberServiceImpl memberServiceImpl, HttpSession session) {
		if (vo.getId() == null || vo.getId().equals("")) {
			return "main.jsp";
		}
		MemberVO member = memberService.getMember(vo);
		System.out.println("vo:"+vo);
		if (member != null) {
			if((vo.getId()).equals("admin")) {
				session.setAttribute("admin", member);
				System.out.println("admin login : " + session +", admin: "+ session.getAttribute("admin"));
				return "adminPage.do";
			}else {
				session.setAttribute("member", member);
				System.out.println("login session : " + session +", member: "+ session.getAttribute("member"));
				return "Trip.jsp";
			}
		} else
			return "main.do";
	}

	// 로그아웃
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		System.out.println("MemberController >>> 로그아웃 요청 처리(logout)");
		session.invalidate();
		return "main.jsp";
	}

	// ID 찾기
	@RequestMapping("/forgotId.do")
	 public String forgotId(MemberVO vo, MemberServiceImpl memberServiceImpl,HttpSession session, Model model) {
		 System.out.println("MemberController >>> id찾기 요청 처리(forgotId)");
		 //MemberVO member = memberService.getMember(vo);
		 
		 System.out.println("name : "+vo.getName());
		 System.out.println("email : "+vo.getEmail());
		 
		 model.addAttribute("name",vo.getName());
		 model.addAttribute("email",vo.getEmail());
		 List<MemberVO> list = memberService.getMemberList(vo);
		 model.addAttribute("list", list);
		 
		 return "findId.jsp";
		 
	}

	// PW 찾기
	@RequestMapping("/forgotPw.do")
	public String forgotPw(MemberVO vo, MemberServiceImpl memberServiceImpl, HttpSession session, Model model) {
		System.out.println("MemberController >>> pw찾기 요청 처리(forgotPw)");
		System.out.println("id : " + vo.getId());
		System.out.println("name : " + vo.getName());
		System.out.println("email : " + vo.getEmail());

		model.addAttribute("id", vo.getId());
		model.addAttribute("name", vo.getName());
		model.addAttribute("email", vo.getEmail());
		List<MemberVO> list = memberService.getMemberList(vo);
		model.addAttribute("list", list);

		return "findPw.jsp";

	}
	
	// 카카오 로그인	 
	@RequestMapping(value = "/kakaologin.do" , produces = "application/json", method = {RequestMethod.GET, RequestMethod.POST})
	public String kakaoLogin(@RequestParam(value="code", required=false) String code , HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception{
	  JsonNode token = kakaoController.getAccessToken(code);
	  JsonNode profile = kakaoController.getKakaoUserInfo(token.path("access_token").toString());
	  System.out.println(profile);
	  MemberVO vo = kakaoController.changeData(profile);
	  vo.setId("k"+vo.getId());

	  System.out.println(session);
	  session.setAttribute("k_login", vo);
	  System.out.println(vo.toString());

	  vo = memberService.kakaoLogin(vo);  
	  return "kakaoLoginOk.jsp";
	}
	
	//회원정보페이지
	@RequestMapping("/myPage.do")
	public String getMember(HttpSession session, Model model) {
		System.out.println("MemberController >>> 마이페이지 (myPage)");
		System.out.println("member:" + session.getAttribute("member"));
		
		MemberVO member = (MemberVO) session.getAttribute("member");
		String id = member.getId();
		
		System.out.println("mypage : session : " + session +", member: "+ member);
		
		model.addAttribute("member", memberService.myPageMember(id));
		model.addAttribute("board", memberService.myPageBoard(id));
		model.addAttribute("boardCount", memberService.boardCount(id));
		
		return "myPage.jsp";
	}
		 
	//회원정보수정
	@RequestMapping("/userEdit.do")
	public String updateMember(MemberVO vo, HttpSession session, Model model, HttpServletRequest request) {
		System.out.println("MemberController >>> 회원 수정 (updateMember)");
		
		MemberVO member = (MemberVO) session.getAttribute("member");
		int m_idx = member.getM_idx();
		
		vo.setM_idx(m_idx);
		vo.setId(request.getParameter("id"));
		vo.setName(request.getParameter("name"));
		vo.setNick_name(request.getParameter("nick_name"));
		vo.setAddress(request.getParameter("address"));
		vo.setJob(request.getParameter("job"));
		vo.setGender(request.getParameter("gender"));
		vo.setAge(Integer.parseInt(request.getParameter("age")));
		vo.setUtopia(request.getParameter("utopia"));
		vo.setEmail(request.getParameter("email"));
		vo.setIntroduce(request.getParameter("introduce"));
		memberService.updateMember(vo);
		model.addAttribute("member", memberService.myPageMember(vo.getId()));
		return "userEdit.jsp";
	}
	
	//패스워드 수정
	@RequestMapping("/editPw.do")
	public String updatePassword(MemberVO vo, HttpSession session, Model model, HttpServletRequest request) {
		System.out.println("MemberController >>> 비밀번호 변경 (updatePassword)");
		
		MemberVO member = (MemberVO) session.getAttribute("member");
		int m_idx = member.getM_idx();
		
		vo.setM_idx(m_idx);
		vo.setPassword(request.getParameter("password2"));
		memberService.updatePassword(vo);
		model.addAttribute("member", memberService.myPageMember(member.getId()));
		return "userEdit.jsp";
	}
	
	//회원 탈퇴
	@RequestMapping("/userDel.do")
	public String deleteMember(HttpSession session) {
		System.out.println("MemberController >>> 회원 삭제 (deleteMember)");
		
		MemberVO member = (MemberVO) session.getAttribute("member");

		memberService.deleteMember(member);
		
		System.out.println("user_del : " + session);
		session.invalidate();
		
		return "main.jsp";
	}


}
