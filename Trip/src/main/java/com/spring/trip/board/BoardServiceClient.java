package com.spring.trip.board;

import java.util.List;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class BoardServiceClient {

	public static void main(String[] args) {
		System.out.println(">>main 함수 들어옴");
		//1. 스프링컨테이너 기동
		AbstractApplicationContext container
			= new GenericXmlApplicationContext("applicationContext.xml");
		System.out.println(">>main-스프리컨테이너 기동");

		//2. 필요한 객체 사용
		//Board 테이블에 데이타 입력,수정,삭제,조회
		BoardService boardService 
			= (BoardService) container.getBean("boardService");
		System.out.println(">>main-컨테이너 getBean");

		//2-1 입력
		BoardVO vo = new BoardVO();
		vo.setBb_idx(1);
		BoardVO getVO =boardService.getBoard(vo);
		System.out.println(getVO);
		
		//3. 컨테이너 종료(close)
		container.close();
	}

}
