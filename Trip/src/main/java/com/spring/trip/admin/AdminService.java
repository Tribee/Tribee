package com.spring.trip.admin;

import java.util.List;

public interface AdminService {
	//CRUD 기능 구현 메소드 정의
	//글입력
	void insertAdmin(AdminVO vo);
	//글수정
	void updateAdmin(AdminVO vo);
	//글삭제
	void deleteAdmin(AdminVO vo);
	//글 상세 조회
	AdminVO getAdmin(AdminVO vo);
	//글 목록 전체 조회
	List<AdminVO> getAdminList();
	//관리자 로그인시 정보조회
	AdminVO adminLogin(String idx);
	
}
