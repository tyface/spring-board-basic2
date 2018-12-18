package com.board.spring;

import java.sql.Connection;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class DataSourceTest {

	@Inject
	private DataSource ds;
	
//	@Test
//	public void testConection() throws Exception{
//		try(Connection con = ds.getConnection()){
//			System.out.println(con);
//		}catch(Exception e) {
//			e.printStackTrace();
//		}//try_
//	}//test_
	
	@Test
	public void test() throws Exception{
		System.out.println(0/10);
	}//test_
	
	
}