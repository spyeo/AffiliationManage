package com.coreplus.dbtest;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.coreplus.mapper.CodeMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class JDBCTest {

	static {
		try {
			Class.forName("net.sf.log4jdbc.sql.jdbcapi.DriverSpy");
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	@Setter(onMethod_ = @Autowired)
	private CodeMapper mapper;
	
	@Test
	public void getCode() {
		mapper.getCode().forEach(code -> log.info(code));
	}
	
	public void testConnection() {
		try(Connection con= DriverManager.getConnection(
				"jdbc:log4jdbc:oracle:thin:@192.168.0.53:1521:orcl","test","test")){
			log.info(con);
		} catch(Exception e) {
			fail(e.getMessage());
		}
	}
}
