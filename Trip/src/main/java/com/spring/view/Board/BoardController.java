package com.spring.view.Board;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.trip.board.BoardService;
import com.spring.trip.board.BoardVO;
import com.spring.trip.board.CommentVO;
import com.spring.trip.board.FileUploadVO;

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
	
	
	/////////////////////////////////////////////////////////ckeditor로 이미지 업로드 테스트////////////////////////////////////////////////
	
//	@RequestMapping(value = "/ckeditorImgUpload.do", method = RequestMethod.POST)
//    public void communityImageUpload(HttpServletRequest request, HttpServletResponse response, @RequestParam MultipartFile upload) {
//		OutputStream out = null;
//		PrintWriter printWriter = null;
//		response.setCharacterEncoding("utf-8");
//		
//		try {
//			String fileName = upload.getOriginalFilename();
//			byte[] bytes = upload.getBytes();
//			String uploadPath = "저장경로/" + fileName; //저장경로
//			
//			out = new FileOutputStream(new File(uploadPath));
//			out.write(bytes);
//			String callback = request.getParameter("CKEditorFuncNum");
//			
//			printWriter = response.getWriter();
//			String fileUrl = "저장한 URL경로/" + fileName; //url 경로
//			
//			printWriter.println("<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction("
//					+ callback
//					+ ",'"
//					+ fileUrl
//					+ "','이미지를 업로드 하였습니다.'"
//					+ ")</script>");
//			printWriter.flush();
//		} catch (IOException e) {
//			e.printStackTrace();
//		} finally {
//			try {
//				if (out != null) {
//					out.close();
//				} if(printWriter != null) {
//					printWriter.close();
//				}
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//		}
//	}
	
	
	@Controller
	public class FileUploadController{
	    @RequestMapping(value = "/fileUpload.do")
	    public String fileUpload(@ModelAttribute("fileUploadVO") FileUploadVO fileUploadVO , HttpServletRequest request , Model model){
	        HttpSession session = request.getSession();
	        String rootPath = session.getServletContext().getRealPath("/");
	        String attachPath = "upload/";

	        MultipartFile upload = fileUploadVO.getUpload();
	        String filename = "";
	        String CKEditorFuncNum = "";
	        
	        if(upload != null){
	            filename = upload.getOriginalFilename();
	            fileUploadVO.setFilename(filename);
	            CKEditorFuncNum = fileUploadVO.getCKEditorFuncNum();
	            try{
	                File file = new File(rootPath + attachPath + filename);
	                upload.transferTo(file);
	            }catch(IOException e){
	                e.printStackTrace();
	            }  
	        }
	            model.addAttribute("filePath",attachPath + filename);          //결과값을
	            model.addAttribute("CKEditorFuncNum",CKEditorFuncNum);//jsp ckeditor 콜백함수로 보내줘야함
	        return "ckeditorCallback.jsp";
	    }
	}
	
	
	
//	
	/////////////////////////////////////////////////////////ckeditor로 이미지 업로드 테스트////////////////////////////////////////////////

	
	
	
	
	
	
	
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
	
	
	//comment 작성 부분==========================================
	@RequestMapping("/commentList.do")
	@ResponseBody //response 객체의 몸체(body)에 데이타 전달
	public List<CommentVO> commentList(BoardVO vo, HttpServletRequest request) {
		String bb_idx = request.getParameter("world_bb_idx");
		System.out.println("bb_idx : "+ bb_idx);
		vo.setBb_idx(Integer.parseInt(bb_idx));
		List<CommentVO> commentList = boardService.getCommentList(vo);
		return commentList;
	}
	
	@RequestMapping("/commentInsert.do")
	@ResponseBody //response 객체의 몸체(body)에 데이타 전달
	public void commentInsert(CommentVO vo, HttpServletRequest request) {
		String bb_idx = request.getParameter("bb_idx");
		String id = request.getParameter("id");
		String content = request.getParameter("content");
		System.out.println("bb_idx : "+ bb_idx);
		System.out.println("id : "+ id);
		System.out.println("content : "+ content);
		vo.setBb_idx(bb_idx);
		vo.setId(id);
		vo.setContent(content);
		
		boardService.insertComment(vo);
		System.out.println("댓글 완료!");

	}
	
}
