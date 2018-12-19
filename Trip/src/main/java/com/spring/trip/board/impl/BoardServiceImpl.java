package com.spring.trip.board.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.trip.board.BoardService;
import com.spring.trip.board.BoardVO;
import com.spring.trip.board.CommentVO;

//@Service : @Component를 상속받아 만든 비즈니스 로직처리 서비스 영역에 사용
@Service("boardService")
public class BoardServiceImpl implements BoardService{
	@Autowired
	//private BoardDAO boardDAO;
	//private BoardDAOMybatis1 boardDAO;
	private BoardDAOMybatis2 boardDAO;
	
	public BoardServiceImpl() {
		System.out.println(">> BoardServiceImpl 객체생성");
	}
	
	@Override
	public void insertBoard(BoardVO vo) {
		boardDAO.insertBoard(vo);
	}

	@Override
	public void updateBoard(BoardVO vo) {
		boardDAO.updateBoard(vo);
	}

	@Override
	public void deleteBoard(BoardVO vo) {
		boardDAO.deleteBoard(vo);
	}

	@Override
	public BoardVO getBoard(BoardVO vo) {
		System.out.println(">> getBoard 실행");
		return boardDAO.getBoard(vo);
	}

	@Override
	public List<BoardVO> getBoardList(BoardVO vo) {
		return boardDAO.getBoardList(vo);
	}
	
	@Override
	public int getBoardSeq() {
		return boardDAO.getBoardSeq();
	}
	
	public List<CommentVO> getCommentList(BoardVO vo){
		return boardDAO.getCommentList(vo);
	}
	
	public int insertComment(CommentVO vo) {
		return boardDAO.insertComment(vo);
	}
	
}
