package com.spring.trip.member;

import java.util.ArrayList;
import java.util.List;

import com.spring.trip.board.BoardVO;

public interface MemberService {
	//CRUD 기능 구현 메소드 정의
	//회원 등록
	void insertMember(MemberVO vo);
	//회원 정보 수정
	void updateMember(MemberVO vo);
	//회원 삭제
	void deleteMember(MemberVO vo);
	
	//회원 상세 조회
	MemberVO getMember(MemberVO vo);
	//회원 목록 전체 조회
	List<MemberVO> getMemberList(MemberVO vo);
	
	//회원가입시 id중복체크
	int idDuplChk(String id);
	//회원가입시 닉네임 중복체크
	int nickDuplChk(String nick_name);
	//아이디 찾기
	ArrayList<String> findId(MemberVO vo) throws Exception;
	//카카오 로그인
	MemberVO kakaoLogin(MemberVO vo);
	
	//회원정보 조회 (마이페이지)
	MemberVO myPageMember(String id);
	//회원 게시글 리스트 조회(마이페이지)
	List<BoardVO> myPageBoard(String id);
	//게시글 수(마이페이지)
	int boardCount(String id);
	//비밀번호 변경(마이페이지)
	void updatePassword(MemberVO vo);
	


}
