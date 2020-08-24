package kr.ac.skuniv.graduation.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.skuniv.graduation.dto.Admin;
import kr.ac.skuniv.graduation.dto.NewsPaging;
import kr.ac.skuniv.graduation.dto.NoticePaging;
import kr.ac.skuniv.graduation.dto.User;
import kr.ac.skuniv.graduation.service.AdminService;
import kr.ac.skuniv.graduation.service.NewsService;
import kr.ac.skuniv.graduation.service.NoticeService;
import kr.ac.skuniv.graduation.service.UserService;

@Controller
public class MainController {
	@Autowired
	UserService userService;

	@Autowired
	AdminService adminService;
	
	@Autowired
	NoticeService noticeService;
	
	@Autowired
	NewsService newsService;

	/*
	 * @RequestMapping("/main") public String main() { return "main"; }
	 */
	@GetMapping("/main")
	public String main(Model model1, Model model2,NoticePaging pagination1,NewsPaging pagination2) {
		model1.addAttribute("noticeList", noticeService.getNotices(pagination1));
		
		model2.addAttribute("newsList", newsService.getNewss(pagination2));
		return "main";
	}
	/*개인정보 처리 방침*/
	@RequestMapping("/privacy")
	public String privacy() {
		return "privacy";
	}
	/*서비스 이용약관*/
	@RequestMapping("/service")
	public String service() {
		return "service";
	}
	/* 로그인 */
	@RequestMapping("/login")
	public String login() {
		return "login";
	}

	@RequestMapping("/loginCheck")
	public String loginCheck(Model model, User user, HttpSession session, HttpServletRequest request,
			HttpServletResponse response,
			Model model1, Model model2,NoticePaging pagination1,NewsPaging pagination2) throws Exception {

		boolean loginFlag1 = userService.loginCheck(user);
		
		
		if (loginFlag1) {

			User user2 = userService.getUser(user.getUser_id());

			session.setAttribute("id", user.getUser_id());
			session.setAttribute("password", user.getUser_pwd());

			session.setAttribute("name", user2.getName());
			session.setAttribute("phoneNum", user2.getPhoneNum());
			session.setAttribute("role", user2.getRole());
			
			model1.addAttribute("noticeList", noticeService.getNotices(pagination1));
			
			model2.addAttribute("newsList", newsService.getNewss(pagination2));
			return "main";
		} else {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('아이디와 비밀번호를 확인해주세요.')");
			out.println("</script>");
			out.flush();

			return "login";
		}
		

	}
	@RequestMapping("/loginCheck2")
	public String loginCheck2(Model model, Admin admin, HttpSession session, HttpServletRequest request,
			HttpServletResponse response, Model model1, Model model2,NoticePaging pagination1,NewsPaging pagination2) throws Exception {

		boolean loginFlag2 = adminService.loginCheck(admin);

		if (loginFlag2) {

			Admin admin2 = adminService.getAdmin(admin.getAdmin_id());

			session.setAttribute("id", admin2.getAdmin_id());
			session.setAttribute("password", admin2.getAdmin_pwd());

			session.setAttribute("name", admin2.getName());
			session.setAttribute("phoneNum", admin2.getPhoneNum());
			session.setAttribute("role", admin2.getRole());
			
			System.out.println(admin2.getRole());
			
model1.addAttribute("noticeList", noticeService.getNotices(pagination1));
			
			model2.addAttribute("newsList", newsService.getNewss(pagination2));
			return "main";
		} else {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('아이디와 비밀번호를 확인해주세요.')");
			out.println("</script>");
			out.flush();

			return "login";
		}
		

	}

	@RequestMapping("/logout")
	public void logout(HttpSession session,HttpServletResponse response) throws Exception {
		session.invalidate();

		userService.logout(response);
		//ModelAndView mv = new ModelAndView("redirect:/");

		//return mv;
	}

	/* 학생 회원가입 */
	@GetMapping("/signupCheck1")
	public void signupCheck1() {

	}

	// SignUp GET
	@GetMapping("/signup")
	public void joinFormGET() {

	}

	// SignUp PosT
	@PostMapping("/signup")
	public String joinFormPOST(User user, Model model) {
		// System.out.println("---"+user.toString());
		userService.regUser(user);

		model.addAttribute("userList", userService.getUsers());
		return "login";
	}

	// 회원 확인
	@ResponseBody
	@PostMapping("/idCheck")
	public int postIdCheck(HttpServletRequest req) throws Exception {
		// logger.info("post idCheck");

		String userId = req.getParameter("user_id");
		User idCheck = userService.idCheck(userId);

		int result = 0;

		if (idCheck != null) {
			result = 1;
		}

		return result;
	}

	/* 관리자 회원가입 */
	@GetMapping("/signupCheck2")
	public String signupCheck2() {
		return "Admin/signupCheck2";
	}

	// SignUp GET
	@GetMapping("/signup2")
	public String joinFormGET2() {
		return "Admin/signup2";
	}

	// SignUp PosT
	@PostMapping("/signup2")
	public String joinFormPOST2(Admin admin, Model model) {
		 System.out.println("---"+admin.toString());
		adminService.regAdmin(admin);

		//model.addAttribute("adminList", adminService.getAdmins());
		return "login";
	}

	// 회원 확인
	@ResponseBody
	@PostMapping("/idCheck2")
	public int postIdCheck2(HttpServletRequest req) throws Exception {
		// logger.info("post idCheck");

		String adminId = req.getParameter("admin_id");
		Admin idCheck = adminService.idCheck(adminId);

		int result = 0;

		if (idCheck != null) {
			result = 1;
		}

		return result;
	}

}
