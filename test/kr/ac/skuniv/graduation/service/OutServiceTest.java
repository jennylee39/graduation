package kr.ac.skuniv.graduation.service;

import static org.junit.Assert.assertNotNull;

import java.sql.Timestamp;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.ac.skuniv.graduation.config.ApplicationConfig;
import kr.ac.skuniv.graduation.dto.Out;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = ApplicationConfig.class)
public class OutServiceTest {

	@Autowired
	OutService outService;

	/*
	 * @Test public void addOut() { Out out = new Out();
	 * 
	 * String text="2019-09-26 22:10:06";
	 * 
	 * out.setOutBno(2); out.setTitle("외박신청"); out.setOutTerm("1박 2일");
	 * out.setOutDay("9월 27일부터 9월 28일까지"); out.setPlace("본가");
	 * out.setPhoneNum("01072681539"); out.setEmerPhone("01065250335");
	 * out.setWhy("쉬러 가요."); out.setWriter("이정훈");
	 * out.setAddDate(Timestamp.valueOf(text)); out.setCount(0);
	 * 
	 * 
	 * System.out.println(outService.regOut(out) + "+++"); }
	 */

	/*
	 * @Test public void getOuts() { assertNotNull(outService.getOuts());
	 * 
	 * }
	 */
}
