package com.spring.trip.admin.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.trip.admin.AdminService;
import com.spring.trip.admin.AdminVO;

//@Service : @Component를 상속받아 만든 비즈니스 로직처리 서비스 영역에 사용
@Service("adminService")
public class AdminServiceImpl implements AdminService{
	@Autowired
	private AdminDAOMybatis2 adminDAO;
	
	public AdminServiceImpl() {
		System.out.println(">> AdminServiceImpl 객체생성");
	}

	@Override
	public void insertAdmin(AdminVO vo) {
		System.out.println(">> adminServiceImpl - insertAdmin()실행");
		adminDAO.insertAdmin(vo);
	}

	@Override
	public void updateAdmin(AdminVO vo) {
		System.out.println(">> adminServiceImpl - updateAdmin()실행");
		adminDAO.updateAdmin(vo);
	}

	@Override
	public void deleteAdmin(AdminVO vo) {
		System.out.println(">> adminServiceImpl - deleteAdmin()실행");
		adminDAO.deleteAdmin(vo);
	}

	@Override
	public AdminVO getAdmin(AdminVO vo) {
		System.out.println(">> adminServiceImpl - getAdmin()실행");
		return adminDAO.getAdmin(vo);
	}

	@Override
	public List<AdminVO> getAdminList() {
		System.out.println(">> adminServiceImpl - getAdminList()실행");
		return adminDAO.getAdminList();
	}

	@Override
	public AdminVO adminLogin(String idx) {
		System.out.println(">> adminServiceImpl - adminLogin(String idx)실행");
		return adminDAO.adminLogin(idx);
	}

	@Override
	public int allClients() {
		int cilentsCnt = adminDAO.allClients();
		return cilentsCnt;
	}

	@Override
	public int allBoards() {
		int boardsCnt = adminDAO.allBoards();
		return boardsCnt;
	}

	@Override
	public int allCountries() {
		int contriesCnt = adminDAO.allCountries();
		return contriesCnt;
	}
	
}
