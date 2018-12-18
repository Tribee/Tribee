package com.spring.trip.member.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.trip.member.MemberVO;
import com.spring.trip.board.BoardVO;
import com.spring.trip.member.MemberService;

//@Service : @Component를 상속받아 만든 비즈니스 로직처리 서비스 영역에 사용
@Service("memberService")
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAOMybatis2 memberDAO;

	public MemberServiceImpl() {
		System.out.println(">> MemberServiceImpl 객체생성");
	}

	// 회원 가입
	@Override
	public void insertMember(MemberVO vo) {
		System.out.println("MemberServiceImpl >> insertMember 요청");
		memberDAO.insertMember(vo);
	}

	// 회원 정보 수정
	@Override
	public void updateMember(MemberVO vo) {
		System.out.println("MemberServiceImpl >> updateMember 요청");
		memberDAO.updateMember(vo);
	}

	// 회원 삭제
	@Override
	public void deleteMember(MemberVO vo) {
		System.out.println("MemberServiceImpl >> deleteMember요청");
		memberDAO.deleteMember(vo);
	}

	// 회원 조회(로그인시 사용)
	@Override
	public MemberVO getMember(MemberVO vo) {
		System.out.println("MemberServiceImpl >> getMember 요청");
		return memberDAO.getMember(vo);
	}

	// 회원 목록 조회
	@Override
	public List<MemberVO> getMemberList(MemberVO vo) {
		System.out.println("MemberServiceImpl >> getMemberList 요청");
		return memberDAO.getMemberList(vo);
	}

	// 회원 가입 ID중복 체크
	@Override
	public int idDuplChk(String id) {
		int result = memberDAO.idDuplChk(id);
		return result;
	}
	
	// 회원 가입 닉네임 중복 체크
	@Override
	public int nickDuplChk(String nick_name) {
		int result = memberDAO.nickDuplChk(nick_name);
		return result;
	}
	
	//카카오 로그인
	@Override
	public MemberVO kakaoLogin(MemberVO vo) {
		return null;
	}

	//마이페이지 회원정보
	@Override
	public MemberVO myPageMember(String id) {
		System.out.println("MemberServiceImpl >> myPageMember 요청");
		return memberDAO.myPageMember(id);
	}
	
	//마이페이지 내가 쓴 글
	@Override
	public List<BoardVO> myPageBoard(String id) {
		System.out.println("MemberServiceImpl >> myPageBoard 요청");
		return memberDAO.myPageBoard(id);
	}
	
	//마이페이지 내가 쓴 글 개수
	@Override
	public int boardCount(String id) {
		System.out.println("MemberServiceImpl >> boardCount 요청");
		return memberDAO.boardCount(id);
	}
	
	//비밀번호 변경
	@Override
	public void updatePassword(MemberVO vo) {
		System.out.println("MemberServiceImpl >> updatePassword 요청");
		memberDAO.updatePassword(vo);
	}

	@Override
	public ArrayList<String> findId(MemberVO vo) throws Exception {
		return null;
	}
	
	
	
}
