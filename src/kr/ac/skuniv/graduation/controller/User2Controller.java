package kr.ac.skuniv.graduation.controller;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.ac.skuniv.graduation.dto.Council;
import kr.ac.skuniv.graduation.dto.Current;
import kr.ac.skuniv.graduation.dto.Rule;
import kr.ac.skuniv.graduation.service.CouncilService;
import kr.ac.skuniv.graduation.service.CurrentService;
import kr.ac.skuniv.graduation.service.RuleService;

@Controller
public class User2Controller {

	@Autowired
	ServletContext servletContext;

	@Autowired
	RuleService ruleService;

	@Autowired
	CouncilService councilService;

	@Autowired
	CurrentService currentService;

	/******************
	 * ****1_intro***** 
	 * ******소개*******
	 ****************/
	@GetMapping("/intro")
	public String intro() {
		return "User/1_intro/intro";
	}

	// 찾아오는길
	@GetMapping("/map")
	public String map() {
		return "User/1_intro/map";
	}

	// 학사개요
	@GetMapping("/summary")
	public String summary() {
		return "User/1_intro/summary";
	}

	// 조직도
	@GetMapping("/chart")
	public String chart() {
		return "User/1_intro/chart";
	}

	// 입사생 현황
	@GetMapping("/current")
	public String current(Model model) {
		model.addAttribute("currentList", currentService.getCurrents());
		return "User/1_intro/current";
	}

	@GetMapping("/addCurrent")
	public String addCurrent(Model model) {

		model.addAttribute("currentList", currentService.getCurrents());
		return "User/1_intro/addCurrent";
	}

	@PostMapping("/addCurrent")
	public String addCurrent(Current current, Model model, HttpServletResponse response, @RequestParam String id)
			throws Exception {

		Current idCheck = currentService.currentCheck(id);

		if (idCheck != null) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('구분단위가 중복됩니다.')");
			out.println("</script>");
			out.flush();

			model.addAttribute("currentList", currentService.getCurrents());

			return "User/1_intro/addCurrent";
		}

		currentService.addCurrent(current);

		model.addAttribute("currentList", currentService.getCurrents());
		return "User/1_intro/addCurrent";
	}

	@GetMapping("/updateCurrent")
	public String updateCurrent(@RequestParam("id") String id, Model model, Model model2) {
		model.addAttribute("detailCurrent", currentService.getCurrent(id));

		model2.addAttribute("currentList", currentService.getCurrents());
		return "User/1_intro/updateCurrent";
	}

	@PostMapping("updateCurrent")
	public String updateCurrent(Current current, Model model, @RequestParam("id") String id) {
		currentService.updateCurrent(current);
		model.addAttribute("currentList", currentService.getCurrents());

		return "User/1_intro/addCurrent";
	}

	@RequestMapping("deleteCurrent")
	public String deleteCurrent(@RequestParam String id, Model model) {
		currentService.deleteCurrent(id);
		model.addAttribute("currentList", currentService.getCurrents());

		return "User/1_intro/addCurrent";

	}

	// 운영규정
	@GetMapping("/rule")
	public String rule(Model model) {

		model.addAttribute("ruleList", ruleService.getRules());
		return "User/1_intro/rule";
	}

	@GetMapping("addRule")
	public String addRule(Model model) {
		model.addAttribute("ruleList", ruleService.getRules());
		return "User/1_intro/addRule";
	}

	@PostMapping("addRule")
	public String addRule(Rule rule, Model model, HttpServletResponse response, @RequestParam("id") int id)
			throws Exception {

		Rule idCheck = ruleService.ruleCheck(id);

		if (idCheck != null) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('연번이 중복됩니다.')");
			out.println("</script>");
			out.flush();

			model.addAttribute("ruleList", ruleService.getRules());

			return "User/1_intro/addRule";
		}

		ruleService.regRule(rule);

		model.addAttribute("ruleList", ruleService.getRules());

		return "User/1_intro/addRule";

	}

	@GetMapping("updateRule")
	public String updateRule(@RequestParam("id") int id, Model model, Model model2) {
		model.addAttribute("detailRule", ruleService.getRule(id));

		model2.addAttribute("ruleList", ruleService.getRules());
		return "User/1_intro/updateRule";
	}

	@PostMapping("updateRule")
	public String updateRule(Rule rule, Model model, @RequestParam("id") int id) {
		ruleService.updateRule(rule);

		model.addAttribute("ruleList", ruleService.getRules());

		return "User/1_intro/addRule";
	}

	@RequestMapping("deleteRule")
	public String deleteRule(@RequestParam("id") int id, Model model) {
		ruleService.deleteRule(id);
		model.addAttribute("ruleList", ruleService.getRules());

		return "User/1_intro/addRule";

	}

	/**********************
	 * * ****5_council***** ******학생자치회*******
	 *******************/
	@GetMapping("council_rule")
	public String council_rule() {

		return "User/5_council/council_rule";
	}

	@GetMapping("council_form")
	public String council_form(Model model) {
		model.addAttribute("councilList", councilService.getCouncils());

		return "User/5_council/council_form";
	}

	@GetMapping("addCouncil")
	public String addCouncil(Model model) {
		model.addAttribute("councilList", councilService.getCouncils());
		return "User/5_council/addCouncil";
	}

	@PostMapping("addCouncil")
	public String addCouncil(Council council, Model model, HttpServletResponse response, @RequestParam("id") int id)
			throws Exception {

		Council idCheck = councilService.councilCheck(id);

		if (idCheck != null) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('아이디가 중복됩니다.')");
			out.println("</script>");
			out.flush();

			model.addAttribute("councilList", councilService.getCouncils());

			return "User/5_council/addCouncil";
		}

		councilService.addCouncil(council);

		model.addAttribute("councilList", councilService.getCouncils());

		return "User/5_council/addCouncil";

	}

	@GetMapping("updateCouncil")
	public String updateCouncil(@RequestParam("id") int id, Model model, Model model2) {
		model.addAttribute("detailCouncil", councilService.getCouncil(id));

		model2.addAttribute("councilList", councilService.getCouncils());
		return "User/5_council/updateCouncil";
	}

	@PostMapping("updateCouncil")
	public String updateCouncil(Council council, Model model, @RequestParam("id") int id) {
		councilService.updateCouncil(council);

		model.addAttribute("councilList", councilService.getCouncils());

		return "User/5_council/addCouncil";
	}

	@RequestMapping("deleteCouncil")
	public String deleteCouncil(@RequestParam("id") int id, Model model) {
		councilService.deleteCouncil(id);
		model.addAttribute("councilList", councilService.getCouncils());

		return "User/5_council/addCouncil";

	}

}
