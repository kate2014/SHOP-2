package com.shop.test;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import com.shop.entity.XxAdmin;
import com.shop.service.backstage.LoginService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:config/ApplicationContext-*.xml") 
public class TestByJunit extends AbstractJUnit4SpringContextTests{
	@Resource
	LoginService ls;
	
	@Test
	public void test1(){
		ls.login(new XxAdmin());
	}

}
