package com.coreplus.persistence;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

import lombok.extern.log4j.Log4j;

@Log4j
public class JDBCTests {

	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void testConnection() {
		
		try(Connection con =
				DriverManager.getConnection(
						"jdbc:oracle:thin:@192.168.0.53:1521:orcl",
						"test",
						"test")){
			
			log.info(con);
		}catch(Exception e) {
			fail(e.getMessage());
		}
		
	}
}
