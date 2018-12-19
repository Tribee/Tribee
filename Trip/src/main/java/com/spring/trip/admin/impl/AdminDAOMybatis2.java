package com.spring.trip.admin.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.trip.admin.AdminVO;

@Repository("adminDAOMybatis2")
public class AdminDAOMybatis2 {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	//게시글 상세조회
	public AdminVO getAdmin(AdminVO vo) {
		System.out.println("===> adminDAO >> Mybatis2로 getAdmin() 처리");
		return mybatis.selectOne("admin.getAdmin", vo);
	}
	
	//게시글 전체조회
	public List<AdminVO> getAdminList() {
		System.out.println("===> adminDAO >> Mybatis2로 getAdminList() 처리");
		return mybatis.selectList("admin.getAdminList");
	}

	public void insertAdmin(AdminVO vo) {
		System.out.println("===> adminDAO >> Mybatis2로 insertAdmin() 처리");
		mybatis.insert("admin.insertAdmin", vo);
	}

	public void updateAdmin(AdminVO vo) {
		System.out.println("===> adminDAO >> Mybatis2로 updateAdmin() 처리");
		mybatis.update("admin.updateAdmin", vo);
	}

	public void deleteAdmin(AdminVO vo) {
		System.out.println("===> adminDAO >> Mybatis2로 deleteAdmin() 처리");
		mybatis.delete("admin.deleteAdmin", vo);
	}
	
	public AdminVO adminLogin(String idx) {
		System.out.println("===> 관리자 로그인시 관리자 객체 불러오기 >> Mybatis2 - adminLogin()");
		return mybatis.selectOne("admin.getAdminLogin", idx);
	}

	public int allClients() {
		int cilentsCnt = mybatis.selectOne("admin.allClients");
		return cilentsCnt;
	}
	
	public int allBoards() {
		int boardsCnt = mybatis.selectOne("admin.allBoards");
		return boardsCnt;
	}

	public int allCountries() {
		int contriesCnt = mybatis.selectOne("admin.allCountries");
		return contriesCnt;
	}
	
	
}
