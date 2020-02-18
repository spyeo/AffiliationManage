package com.coreplus.persistence;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import com.coreplus.domain.Criteria2;

import com.coreplus.domain.StoreVO;
import com.coreplus.mapper.StoreMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {

	@Setter(onMethod_= @Autowired)
	private StoreMapper mapper;
	
	/*@Test
	public void testGetList() {
		
		mapper.getList().forEach(board -> log.info(board));
	}
	
	@Test
	public void testInsert() {
		
		BoardVO board = new BoardVO();
		board.setTitle("새로 작성하는 글");
		board.setContent("새로 작성하는 내용");
		board.setWriter("지은이");
		
		mapper.insert(board);
		log.info(board);
	}
	
	@Test
	public void testInsertSelectKey() {
		
		BoardVO board = new BoardVO();
		board.setTitle("새로 작성하는 글    Select Key ");
		board.setContent("새로 작성하는 내용   Select Key ");
		board.setWriter("지은이  Select Key ");
		
		mapper.insertSelectKey(board);
		log.info(board);
	}
	
	@Test
	public void testRead() {
		
		BoardVO board = mapper.read(7L);
		log.info(board);
	}
	
	@Test
	public void testDelete() {
		
		log.info("DELETE COUNT : " + mapper.delete(11L));
	}
	
	@Test
	public void testUpdate() {
		
		BoardVO board = new BoardVO();
		board.setBno(5L);
		board.setTitle("비가 와요");
		board.setContent("집에 가고싶어요");
		board.setWriter("나는지은이");
		
		int count = mapper.update(board);
		log.info("UPDATE COUNT  : " + count);
	}
	
	@Test
	public void testPaging() {
		
		Criteria cri = new Criteria();
		//List<BoardVO> list = mapper.getListWithPaging(cri);
		//list.forEach(board -> log.info(board));
		cri.setPageNum(3);
		cri.setAmount(10);
		List<BoardVO> list = mapper.getListWithPaging(cri);
		list.forEach(board -> log.info(board.getBno()));
	}
	
	
	@Test
	public void testSearch() {
		
		Criteria2 cri = new Criteria2();
		cri.setKeyword("새로");
		cri.setType("TC");
		
		List<StoreVO> list = mapper.getListPaging(cri);
		list.forEach(board -> log.info(board));
	}*/
	
	@Test
	public void testPaging() {
		
		Criteria2 cri = new Criteria2();
		
		cri.setPageNum(1);
		cri.setAmount(10);
		
		List<StoreVO> list = mapper.getListPaging(cri);
		list.forEach(store -> log.info(store));
	}
}
