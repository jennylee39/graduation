package kr.ac.skuniv.graduation.controller;

import java.io.File;
import java.net.URLEncoder;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.skuniv.graduation.dto.News;
import kr.ac.skuniv.graduation.dto.NewsPaging;
import kr.ac.skuniv.graduation.dto.Notice;
import kr.ac.skuniv.graduation.dto.NoticePaging;
import kr.ac.skuniv.graduation.service.NewsService;
import kr.ac.skuniv.graduation.service.NoticeService;
import kr.ac.skuniv.graduation.service.RuleService;
import kr.ac.skuniv.graduation.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	ServletContext servletContext;
	
	@Autowired
	UserService userService;

	@Autowired
	RuleService ruleService;

	@Autowired
	NoticeService noticeService;

	@Autowired
	NewsService newsService;

	/* 2_facility 시설 */
	// 층별안내
	@GetMapping("/floor")
	public String floor() {
		return "User/2_facility/floor";
	}

	// 시설 및 이용안내
	@GetMapping("/guide")
	public String guide() {
		return "User/2_facility/guide";
	}

	/* 3_inform 알리미 */

	// 행사 일정
	@GetMapping("/schedule")
	public String schedule() {
		return "User/3_inform/schedule";
	}

	// 식단표
	@GetMapping("/carte")
	public String carte() {
		return "User/3_inform/carte";
	}

	// 공지사항
	@GetMapping("/notice")
	public String notice(Model model, @RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range) {
		// 외박신청 전체 게시글 개수
		int listCnt = noticeService.getNoticeListCnt();

		//System.out.println(listCnt);
		NoticePaging pagination = new NoticePaging();
		pagination.pageInfo(page, range, listCnt);
		//System.out.println(pagination.getPageCnt());
		model.addAttribute("pagination", pagination);
		model.addAttribute("noticeList", noticeService.getNotices(pagination));

		return "User/3_inform/notice";
	}

	@GetMapping("addNotice")
	public String addNotice() {
		return "User/3_inform_db/addNotice";
	}

	@PostMapping("/addNotice")
	public String addNotice(Notice notice) throws Exception {

		MultipartFile f = notice.getFile();
		MultipartFile f2 = notice.getFile2();

		if (!f.isEmpty()) { // 파일 업로드가 됐다면
			String orgname1 = f.getOriginalFilename();
			//String newname1 = orgname1 + System.currentTimeMillis() + f.getSize();
			String path1 = servletContext.getRealPath("/uploadFile");
			//System.out.println("path1 : " + path1);

			File file = new File(path1 + File.separator + orgname1);

			notice.setOrgname1(orgname1);
			
			notice.setPath1(path1);
			f.transferTo(file);
		}
		if (!f2.isEmpty()) { // 파일 업로드가 됐다면
			String orgname2 = f2.getOriginalFilename();
			//String newname2 = orgname2 + System.currentTimeMillis() + f2.getSize();
			String path2 = servletContext.getRealPath("/uploadFile");
			//System.out.println("path2 : " + path2);

			File file = new File(path2 + File.separator + orgname2);

			notice.setOrgname2(orgname2);
			

			notice.setPath2(path2);
			f2.transferTo(file);
		}
		noticeService.regNotice(notice);

		return "User/3_inform_db/detailNotice";
	}

	@GetMapping("/detailNotice")
	public ModelAndView detailNotice(Notice notice, @RequestParam int bno, HttpServletRequest request)
			throws Exception {

		noticeService.plusCnt(bno);

		ModelAndView mav = new ModelAndView();

		mav.setViewName("User/3_inform_db/detailNotice");

		mav.addObject("notice", noticeService.viewDetail(bno));

		return mav;

	}


	@GetMapping("/downloadNO")
	public void downloadFile(Notice notice, @RequestParam int bno, HttpServletResponse response) throws Exception {
		//String newName1 = noticeService.viewDetail(bno).getNewname1();
		String orgName1 = noticeService.viewDetail(bno).getOrgname1();
		String path1 = noticeService.viewDetail(bno).getPath1();

		//System.out.println(newName1);

		byte fileByte[] = FileUtils.readFileToByteArray(new File(path1 + "\\" + orgName1));

		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition",
				"attachment; fileName=\"" + URLEncoder.encode(orgName1, "UTF-8") + "\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.getOutputStream().write(fileByte);

		response.getOutputStream().flush();
		response.getOutputStream().close();

	}

	@GetMapping("/downloadNO2")
	public void downloadFile2(Notice notice, @RequestParam int bno, HttpServletResponse response) throws Exception {
		//String newName2 = noticeService.viewDetail(bno).getNewname2();
		String orgName2 = noticeService.viewDetail(bno).getOrgname2();
		String path2 = noticeService.viewDetail(bno).getPath2();

		//System.out.println(newName2);

		byte fileByte2[] = FileUtils.readFileToByteArray(new File(path2 + "\\" + orgName2));

		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte2.length);
		response.setHeader("Content-Disposition",
				"attachment; fileName=\"" + URLEncoder.encode(orgName2, "UTF-8") + "\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.getOutputStream().write(fileByte2);

		response.getOutputStream().flush();
		response.getOutputStream().close();

	}

	// 언론속의학사
	@GetMapping("/news")
	public String news(Model model, @RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range) {
		// 외박신청 전체 게시글 개수
		int listCnt = newsService.getNewsListCnt();

		NewsPaging pagination = new NewsPaging();
		pagination.pageInfo(page, range, listCnt);

		model.addAttribute("pagination", pagination);
		model.addAttribute("newsList", newsService.getNewss(pagination));
		
		return "User/3_inform/news";
	}
	@GetMapping("addNews")
	public String addNews() {
		return "User/3_inform_db/addNews";
	}

	@PostMapping("/addNews")
	public String addNews(News news) throws Exception {

		MultipartFile f = news.getFile();
		MultipartFile f2 = news.getFile2();

		if (!f.isEmpty()) { // 파일 업로드가 됐다면
			String orgname = f.getOriginalFilename();
			//String newname1 = orgname1 + System.currentTimeMillis() + f.getSize();
			String path = servletContext.getRealPath("/uploadFile");
			System.out.println("path1 : " + path);

			File file = new File(path + File.separator + orgname);

			news.setOrgname(orgname);
			
			news.setPath(path);
			f.transferTo(file);
		}
		if (!f2.isEmpty()) { // 파일 업로드가 됐다면
			String orgname2 = f2.getOriginalFilename();
			//String newname2 = orgname2 + System.currentTimeMillis() + f2.getSize();
			String path2 = servletContext.getRealPath("/uploadFile");
			System.out.println("path2 : " + path2);

			File file = new File(path2 + File.separator + orgname2);

			news.setOrgname2(orgname2);
			

			news.setPath2(path2);
			f2.transferTo(file);
		}
		newsService.regNews(news);

		return "User/3_inform_db/detailNews";
	}

	@GetMapping("/detailNews")
	public ModelAndView detailNews(News news, @RequestParam int bno, HttpServletRequest request)
			throws Exception {

		newsService.plusCnt(bno);

		ModelAndView mav = new ModelAndView();

		mav.setViewName("User/3_inform_db/detailNews");

		mav.addObject("news", newsService.viewDetail(bno));

		return mav;

	}


	@GetMapping("/downloadNews")
	public void downloadFile(News news, @RequestParam int bno, HttpServletResponse response) throws Exception {
		//String newName1 = noticeService.viewDetail(bno).getNewname1();
		String orgName = newsService.viewDetail(bno).getOrgname();
		String path = newsService.viewDetail(bno).getPath();

		//System.out.println(newName1);

		byte fileByte[] = FileUtils.readFileToByteArray(new File(path + "\\" + orgName));

		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition",
				"attachment; fileName=\"" + URLEncoder.encode(orgName, "UTF-8") + "\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.getOutputStream().write(fileByte);

		response.getOutputStream().flush();
		response.getOutputStream().close();

	}

	@GetMapping("/downloadNews2")
	public void downloadFile2(News news, @RequestParam int bno, HttpServletResponse response) throws Exception {
		//String newName2 = noticeService.viewDetail(bno).getNewname2();
		String orgName2 = newsService.viewDetail(bno).getOrgname2();
		String path2 = newsService.viewDetail(bno).getPath2();

		//System.out.println(newName2);

		byte fileByte2[] = FileUtils.readFileToByteArray(new File(path2 + "\\" + orgName2));

		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte2.length);
		response.setHeader("Content-Disposition",
				"attachment; fileName=\"" + URLEncoder.encode(orgName2, "UTF-8") + "\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.getOutputStream().write(fileByte2);

		response.getOutputStream().flush();
		response.getOutputStream().close();

	}


	// QnA
	@GetMapping("/qna")
	public String qna() {
		return "User/3_inform/qna";
	}

	


}