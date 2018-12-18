package com.spring.view.Board;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.spring.trip.board.BoardService;
import com.spring.trip.board.BoardVO;

@Controller
//"board"라는 이름의 Model이 있으면 session에 저장
@SessionAttributes("board")
public class BoardController {
	@Autowired
	private BoardService boardService;
	
	@RequestMapping("/getBoard.do")
	public String getBoard(BoardVO vo, Model model) {
		System.out.println(">>> 글 상세 조회 요청 처리(getBoard)");
		
		//Model 형식으로 저장해서 DispatcherServlet에 전달
		//model.addAttribute(attributeName, attributeValue)
		vo.setBb_idx(1);
		System.out.println("null이니? : "+boardService.getBoard(vo));
		model.addAttribute("board", boardService.getBoard(vo));
		
		return "board.jsp";
	}	
	
	@RequestMapping("/getBoardList.do")
	public String getBoardList(BoardVO vo, Model model) {
		System.out.println(">> 글목록 조회 처리(getBoardList)");
		List<BoardVO> boardList = boardService.getBoardList(vo);
		
		//Model 형식으로 저장해서 DispatcherServlet에 전달
		model.addAttribute("boardList", boardList);
		
		return "boardList.jsp";
	}	

	//@RequestMapping(value="/insertBoard.do")
	@RequestMapping("/insertBoard.do")
	public String insertBoard(BoardVO vo) throws IllegalStateException, IOException {
		System.out.println(">>> 글 등록 요청 처리(insertBoard)");
		System.out.println("vo : "+vo);
		
		MultipartFile uploadFile = vo.getUploadFile();
		System.out.println("uploadFile : " + uploadFile);
		
		int boardSeq = boardService.getBoardSeq();
		System.out.println("boardSeq : "+boardSeq);
		
		File saveFile = new File("C:\\3rd_project\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Trip\\resources\\image",boardSeq+".png");
		FileCopyUtils.copy(uploadFile.getBytes(), saveFile);
		
		if(!uploadFile.isEmpty()) { //파일이 있을경우 upload작업 처리
			//try catch를 해주면 사진등록은 안되지만 나머진 등록되고
			//throws를 써주면 아예 등록이 안되게!!
			String fileName = uploadFile.getOriginalFilename();
			
			uploadFile.transferTo(new File("C:\\3rd_project\\TriBee2\\Trip\\src\\main\\webapp\\resources\\image\\" + boardSeq+".png"));
//			uploadFile.transferTo(new File("C:\\temp\\image\\"+boardSeq+".png"));
//			uploadFile.transferTo(new File("C:\\3rd_project\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Trip\\resources\\image\\" + boardSeq+".png"));
				
		}
		vo.setBb_idx(boardSeq);
		System.out.println("vo : "+vo);
		boardService.insertBoard(vo);
		return "getBoardList.do";
	}

	@RequestMapping("/updateBoard.do")
	public String updateBoard(BoardVO vo) {
		System.out.println(">>> 글 수정 요청 처리(updateBoard)");
		
		//전달받은 파라미터값을 사용해서 입력처리
		//스프링에서 파라미터값을 BoardVO 타입의 객체에 입력하고 vo변수에 주입
		boardService.updateBoard(vo);

		return "getBoardList.do";
	}
	
	@RequestMapping("/deleteBoard.do")
	public String deleteBoard(BoardVO vo) {
		System.out.println(">>> 글 삭제 요청 처리(deleteBoard)");
		
		//전달받은 파라미터값을 사용해서 입력처리
		//스프링에서 파라미터값을 BoardVO 타입의 객체에 입력하고 vo변수에 주입
		boardService.deleteBoard(vo);

		return "getBoardList.do";
	}
	
	//전체 게시글 조회
	@RequestMapping(value = "/allBoards.do")
	public String allClients(Model model){
		int boardsCnt = boardService.allBoards();
		model.addAttribute("boardsCnt", boardsCnt);
		System.out.println("boardsCnt : " + boardsCnt);
		
		return "adminPage2.jsp";
	}
	
	//전체 게시글 조회
	@RequestMapping(value = "/allCountries.do")
	public String allCountries(Model model){
		int contriesCnt = boardService.allCountries();
		model.addAttribute("contriesCnt", contriesCnt);
		System.out.println("contriesCnt : " + contriesCnt);
		
		return "adminPage2.jsp";
	}
	
}
