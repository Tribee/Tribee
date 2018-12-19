package com.spring.trip.member.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.trip.board.BoardVO;
import com.spring.trip.member.MemberVO;

@Repository("memberDAOMybatis2")
public class MemberDAOMybatis2 {
	@Autowired
	private SqlSessionTemplate mybatis;

	// 멤버 상세조회
	public MemberVO getMember(MemberVO vo) {
		System.out.println("MemberDAOMybatis2 ===> Mybatis2로 getMember() 처리");
		return mybatis.selectOne("member.getMember", vo);
	}

	// 멤버 전체조회
	public List<MemberVO> getMemberList(MemberVO vo) {
		System.out.println("MemberDAOMybatis2 ===> Mybatis2로 getMemberList() 처리");
		return mybatis.selectList("member.getMemberList", vo);
	}

	// 회원 가입
	public void insertMember(MemberVO vo) {
		System.out.println("MemberDAOMybatis2 ===> Mybatis2로 insertMember() 처리");
		mybatis.insert("member.insertMember", vo);
	}

	// 회원 가입 id중복 체크
	public int idDuplChk(String id) {
		System.out.println("MemberDAOMybatis2 ===> Mybatis2로 joinDAO_idDuplChk 처리");
		int result = mybatis.selectOne("member.joinDAO_idDuplChk", id);
		return result;
	}

	// 회원 가입 닉네임 중복 체크
	public int nickDuplChk(String nick_name) {
		System.out.println("MemberDAOMybatis2 ===> Mybatis2로 joinDAO_nickDuplChk 처리");
		int result = mybatis.selectOne("member.joinDAO_nickDuplChk", nick_name);
		return result;
	}

	// 회원 정보 수정
	public void updateMember(MemberVO vo) {
		System.out.println("MemberDAOMybatis2 ===> Mybatis2로 updateMember() 처리");
		mybatis.insert("member.updateMember", vo);
	}

	// 회원 탈퇴
	public void deleteMember(MemberVO vo) {
		System.out.println("MemberDAOMybatis2 ===> Mybatis2로 deleteMember() 처리");
		mybatis.insert("member.deleteMember", vo);
	}

	// ID 찾기
	public void forgotId(MemberVO vo ) {
		System.out.println("MemberDAOMybatis2 ===> Mybatis2로 forgotId() 처리");
		mybatis.selectOne("member.forgotId", vo);
	}
	
	// PW 찾기
	public void forgotPw(MemberVO vo ) {
		System.out.println("MemberDAOMybatis2 ===> Mybatis2로 forgotPw() 처리");
		mybatis.selectOne("member.forgotPw", vo);
	}
	
	// 마이페이지
	public MemberVO myPageMember(String id) {
		System.out.println("MemberDAOMybatis2 ===> Mybatis2로 myPageMember() 처리");
		return mybatis.selectOne("member.myPageMember", id);
	}
	
	//내가 쓴 글 조회
	public List<BoardVO> myPageBoard(String id) {
		System.out.println("===> Mybatis2로 myPageBoard() 처리");
		return mybatis.selectList("member.myPageBoard", id);
	}
	
	//내가 쓴 글 개수
	public int boardCount(String id) {
		System.out.println("===> Mybatis2로 boardCount() 처리");
		System.out.println("id:" + id);
		return mybatis.selectOne("member.boardCount", id);
	}
	
	// 비밀번호 변경 (마이 페이지)
	public void updatePassword(MemberVO vo) {
		System.out.println("MemberDAOMybatis2 ===> Mybatis2로 updatePassword() 처리");
		mybatis.update("member.updatePassword", vo);
	}


}
