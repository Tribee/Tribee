package com.spring.trip.board.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.trip.board.BoardVO;
import com.spring.trip.board.CommentVO;

@Repository("boardDAOMybatis2")
public class BoardDAOMybatis2 {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	//게시글 상세조회
	public BoardVO getBoard(BoardVO vo) {
		System.out.println("===> Mybatis2로 getBoard() 처리");
		return mybatis.selectOne("board.getBoard", vo);
	}
	
	//게시글 전체조회
	public List<BoardVO> getBoardList(BoardVO vo) {
		System.out.println("===> Mybatis2로 getBoardList() 처리");
		return mybatis.selectList("board.getBoardList", vo);
	}

	public void insertBoard(BoardVO vo) {
		System.out.println("===> Mybatis2로 insertBoard() 처리");
		mybatis.insert("board.insertBoard", vo);
	}

	public void updateBoard(BoardVO vo) {
		System.out.println("===> Mybatis2로 updateBoard() 처리");
		mybatis.insert("board.updateBoard", vo);
	}

	public void deleteBoard(BoardVO vo) {
		System.out.println("===> Mybatis2로 deleteBoard() 처리");
		mybatis.insert("board.deleteBoard", vo);
	}
	
	public int getBoardSeq() {
		System.out.println("===> Mybatis2로 getBoardSeq() 처리");
		return mybatis.selectOne("board.getBoardSeq");
	}
	
	public List<CommentVO> getCommentList(BoardVO vo){
		System.out.println("===> Mybatis2로 commentList 처리");
		return mybatis.selectList("board.commentList", vo);
	}
	
	public int insertComment(CommentVO vo){
		System.out.println("comment Insert 작업전");
		return mybatis.insert("board.commentInsert", vo);
	}

}
