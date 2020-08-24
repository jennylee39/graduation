package kr.ac.skuniv.graduation.controller;

import java.io.File;
import java.net.URLEncoder;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.skuniv.graduation.dto.Dorm;
import kr.ac.skuniv.graduation.dto.DormPaging;
import kr.ac.skuniv.graduation.dto.Etc;
import kr.ac.skuniv.graduation.dto.EtcPaging;
import kr.ac.skuniv.graduation.dto.Formula;
import kr.ac.skuniv.graduation.dto.FormulaPaging;
import kr.ac.skuniv.graduation.dto.Free;
import kr.ac.skuniv.graduation.dto.FreePaging;
import kr.ac.skuniv.graduation.dto.Gallery;
import kr.ac.skuniv.graduation.dto.GalleryPaging;
import kr.ac.skuniv.graduation.dto.Out;
import kr.ac.skuniv.graduation.dto.OutPaging;
import kr.ac.skuniv.graduation.service.DormService;
import kr.ac.skuniv.graduation.service.EtcService;
import kr.ac.skuniv.graduation.service.FormulaService;
import kr.ac.skuniv.graduation.service.FreeService;
import kr.ac.skuniv.graduation.service.GalleryService;
import kr.ac.skuniv.graduation.service.OutService;
@Controller
public class ApplyController{
	@Autowired
	ServletContext servletContext;
	
	@Autowired
	OutService outService;

	@Autowired
	EtcService etcService;
	
	@Autowired
	DormService dormService;
	
	@Autowired
	GalleryService galleryService;
	
	@Autowired
	FormulaService formulaService;
	
	@Autowired
	FreeService freeService;
	

	/* 4_comm 신청 */
	//외박신청
	@GetMapping(value="/apply")
	public String apply1(Model model1,Model model2,Model model3 ,
			@RequestParam(required = false, defaultValue = "1") int page1, @RequestParam(required = false, defaultValue = "1") int range1,
			@RequestParam(required = false, defaultValue = "1") int page2, @RequestParam(required = false, defaultValue = "1") int range2,
			@RequestParam(required = false, defaultValue = "1") int page3, @RequestParam(required = false, defaultValue = "1") int range3) {
		//외박신청 전체 게시글 개수
		int listCnt1 = outService.getOutListCnt();

		//System.out.println(listCnt1 +" 외박신청");
		//Pagination 객체생성
		OutPaging pagination1 = new OutPaging();
		pagination1.pageInfo1(page1, range1, listCnt1);

		model1.addAttribute("pagination1", pagination1);
		model1.addAttribute("outList", outService.getOuts(pagination1));

		//학사 신청 전체 게시글 개수
		int listCnt2 = etcService.getEtcListCnt();
		//System.out.println(listCnt2 +" 봉사 신청");
		//Pagination 객체생성
		EtcPaging pagination2 = new EtcPaging();
		pagination2.pageInfo(page2, range2, listCnt2);

		model2.addAttribute("pagination2", pagination2);
		
		model2.addAttribute("etcList", etcService.getEtcs(pagination2));
		
		//학사 신청 전체 게시글 개수
		int listCnt3 = dormService.getDormListCnt();
	
		//System.out.println(listCnt3+" 학사 신청");
		//Pagination 객체생성
		DormPaging pagination3 = new DormPaging();
		pagination3.pageInfo(page3, range3, listCnt3);

		model3.addAttribute("pagination3", pagination3);
		model3.addAttribute("dormList", dormService.getDorms(pagination3));
		

		
		return "User/4_comm/apply";
	}
	
	//외박신청 글쓰기
	@GetMapping("/addOut")
	public String addOut() {
		return "User/4_comm_Apply/addOut";
	}
	@PostMapping("/addOut")
	public String addOut(Out out,Model model) {
		outService.regOut(out);
		
		
		return "User/4_comm_Apply/detailOut";
	}
	// 외박신청 자세히
	@GetMapping("/detailOut")
	public ModelAndView detailOut(@RequestParam int outBno, Out out, HttpSession session,HttpServletResponse response) throws Exception {
	
			outService.plusCnt(outBno);
			
			ModelAndView mav = new ModelAndView();
			
			mav.setViewName("User/4_comm_Apply/detailOut");
			
			mav.addObject("out",outService.viewDetail(outBno));
			return mav;

	}
	//외박신청 수정하기
	@GetMapping("/updateOut")
	public ModelAndView updateOut(@RequestParam int outBno, @ModelAttribute("out") Out outList) throws Exception {
		
		ModelAndView mav = new ModelAndView("User/4_comm_Apply/updateOut");
		
		
		mav.addObject("outList",outService.viewDetail(outBno));
		return mav;
		
	}
	@RequestMapping("/updateOut")
	public String updateOut(@RequestParam("outBno") int outBno, @ModelAttribute("out") Out out,Model model) {
		
		OutPaging pagination = new OutPaging();
		outService.updateOut(out);
	
		model.addAttribute("outList", outService.getOuts(pagination));

		return "User/4_comm_Apply/detailOut";
	}
	@RequestMapping("deleteOut")
	public String deleteOut(@RequestParam int outBno) {
		outService.deleteOut(outBno);
		
		outService.updateBno(outBno);
		
		return "User/4_comm/apply";
	}
	// 봉사 활동 및 상담 신청
	@GetMapping("/addEtc")
	public String addEtc() {
		return "User/4_comm_Apply/addEtc";
	}
	@PostMapping("/addEtc")
	public String addEtc(Etc etc,Model model) {
		
		etcService.regEtc(etc);
		
		return "User/4_comm_Apply/detailEtc";
	}
	

	@GetMapping("/detailEtc")
	public ModelAndView detailEtc(@RequestParam int etcBno, Out out, HttpSession session,HttpServletResponse response) throws Exception {
	
			etcService.plusCnt(etcBno);
			
			ModelAndView mav = new ModelAndView();
			
			mav.setViewName("User/4_comm_Apply/detailEtc");
			
			mav.addObject("etc",etcService.viewDetail(etcBno));
			return mav;

	}

	@GetMapping("/updateEtc")
	public ModelAndView updateEtc(@RequestParam int etcBno, @ModelAttribute("etc") Etc etcList) throws Exception {
		
		//System.out.println("----"+etcBno);

		ModelAndView mav = new ModelAndView("User/4_comm_Apply/updateEtc");
		
		
		mav.addObject("etcList",etcService.viewDetail(etcBno));
		return mav;
		
	}
	@RequestMapping("/updateEtc")
	public String updateEtc(@RequestParam("etcBno") int etcBno, @ModelAttribute("etc") Etc etc,Model model) {
		EtcPaging pagination = new EtcPaging();
		etcService.updateEtc(etc);

		model.addAttribute("etcList", etcService.getEtcs(pagination));

		return "User/4_comm_Apply/detailEtc";
	}
	
	//학사 신청
	@GetMapping("/addDorm")
	public String addDorm() {
		return "User/4_comm_Apply/addDorm";
	}
	@PostMapping("/addDorm")
	public String addDorm(Dorm dorm) throws Exception {
		
		MultipartFile f = dorm.getFile();
		MultipartFile f2 = dorm.getFile2();
		
		
		if(!f.isEmpty()) { //파일 업로드가 됐다면
			String orgname = f.getOriginalFilename();
			String newname = orgname +System.currentTimeMillis() +f.getSize();
			String path = servletContext.getRealPath("/uploadFile");
			System.out.println("path : "+path);
			
			File file = new File(path+File.separator +newname);
			
			dorm.setOrgname(orgname);
			dorm.setNewname(newname);
			
			dorm.setPath(path);
			f.transferTo(file);
		}
		if(!f2.isEmpty()) { //파일 업로드가 됐다면
			String orgname2 = f2.getOriginalFilename();
			String newname2 = orgname2 +System.currentTimeMillis() +f2.getSize();
			String path2 = servletContext.getRealPath("/uploadFile");
			System.out.println("path : "+path2);
			
			File file = new File(path2+File.separator +newname2);
			
			dorm.setOrgname2(orgname2);
			dorm.setNewname2(newname2);
			
			dorm.setPath2(path2);
			f2.transferTo(file);
		}
		
       
		dormService.regDorm(dorm);
		
		return "User/4_comm_Apply/detailDorm";
	}
	

	@GetMapping("/detailDorm")
	public ModelAndView detailDorm(Dorm dorm,@RequestParam int dormBno, 
			HttpServletRequest request) throws Exception {
	
		dormService.plusCnt(dormBno);
		
			ModelAndView mav = new ModelAndView();
			
			mav.setViewName("User/4_comm_Apply/detailDorm");
			
			
			mav.addObject("dorm",dormService.viewDetail(dormBno));
			
			
			return mav;

	}
	@GetMapping("/download")
	public void downloadFile(Dorm dorm, @RequestParam int dormBno,HttpServletResponse response) throws Exception {
		String newName = dormService.viewDetail(dormBno).getNewname();
		String orgName=dormService.viewDetail(dormBno).getOrgname();
		String path = dormService.viewDetail(dormBno).getPath();

		System.out.println(newName);
		
		byte fileByte[] = FileUtils.readFileToByteArray(new File(path+"\\"+newName));
	
		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition", "attachment; fileName=\""+URLEncoder.encode(orgName,"UTF-8")+"\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.getOutputStream().write(fileByte);
		
		response.getOutputStream().flush();
		response.getOutputStream().close();

		
	}
	@GetMapping("/download2")
	public void downloadFile2(Dorm dorm, @RequestParam int dormBno,HttpServletResponse response) throws Exception {
		String newName2 = dormService.viewDetail(dormBno).getNewname2();
		String orgName2=dormService.viewDetail(dormBno).getOrgname2();
		String path2 = dormService.viewDetail(dormBno).getPath2();

		System.out.println(newName2);
	
		byte fileByte2[] = FileUtils.readFileToByteArray(new File(path2+"\\"+newName2));
		
		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte2.length);
		response.setHeader("Content-Disposition", "attachment; fileName=\""+URLEncoder.encode(orgName2,"UTF-8")+"\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.getOutputStream().write(fileByte2);
		
		
		response.getOutputStream().flush();
		response.getOutputStream().close();
		
	}

	@GetMapping("/updateDorm")
	public ModelAndView updateDorm(@RequestParam int dormBno, @ModelAttribute("dorm") Dorm dorm) throws Exception {
		
		//System.out.println("----"+dormBno);
		ModelAndView mav = new ModelAndView("User/4_comm_Apply/updateDorm");
		
		
		mav.addObject("dormList",dormService.viewDetail(dormBno));
		return mav;
		
	}
	@RequestMapping("/updateDorm")
	public String updateDorm(@RequestParam int dormBno, @ModelAttribute("dorm") Dorm dorm,Model model){
		
		DormPaging pagination = new DormPaging();
		dormService.updateDorm(dorm);
		
		model.addAttribute("dormList", dormService.getDorms(pagination));
		
		return "User/4_comm_Apply/detailDorm";
	}
	@RequestMapping("/deleteDorm")
	public String deleteDorm(Dorm dorm,@RequestParam int dormBno, 
			Model model,DormPaging pagination,
			Model model1, OutPaging pagination1,
			Model model2, EtcPaging pagination2) throws Exception {
		
		dormService.deleteDorm(dormBno);
			
			model.addAttribute("dormList", dormService.getDorms(pagination));
			model1.addAttribute("outList",outService.getOuts(pagination1));
			model2.addAttribute("etcList", etcService.getEtcs(pagination2));
			return "User/4_comm/apply";

	}

	/***************
	 * 갤러리*
	 * ****************/
	@GetMapping("/gallery")
	public String galley(Model model,GalleryPaging pagination,
			@RequestParam(required = false, defaultValue = "1") int page, @RequestParam(required = false, defaultValue = "1") int range) {
		int listCnt = galleryService.getGalleryListCnt();
		
		pagination.pageInfo(page, range, listCnt);

		model.addAttribute("pagination", pagination);
		model.addAttribute("galleryList", galleryService.getGallerys(pagination));
	
		return "User/4_comm/gallery";
	}
	@GetMapping("/addGallery")
	public String addGallery() {
		return "User/4_comm_Apply/addGallery";
	}
	@PostMapping("/addGallery")
	public String addGallery(Gallery gallery) throws Exception{
		MultipartFile f1 = gallery.getFile1();
		MultipartFile f2 = gallery.getFile2();
		MultipartFile f3 = gallery.getFile3();
		MultipartFile f4 = gallery.getFile4();
		
		
		if(!f1.isEmpty()) { //파일 업로드가 됐다면
			String orgname1 = f1.getOriginalFilename();
			String path1 = servletContext.getRealPath("/gallery");
			//System.out.println("path : "+path1);
			
			File file = new File(path1+File.separator +orgname1);
			
			gallery.setOrgname1(orgname1);
			gallery.setPath1(path1);
			f1.transferTo(file);
		}
		if(!f2.isEmpty()) { //파일 업로드가 됐다면
			String orgname2 = f2.getOriginalFilename();
			String path2 = servletContext.getRealPath("/gallery");
			//System.out.println("path : "+path2);
			
			File file = new File(path2+File.separator +orgname2);
		
			gallery.setOrgname2(orgname2);
			gallery.setPath2(path2);
			f2.transferTo(file);
		}
		if(!f3.isEmpty()) { //파일 업로드가 됐다면
			String orgname3 = f3.getOriginalFilename();
			String path3 = servletContext.getRealPath("/gallery");
			//System.out.println("path : "+path3);
			
			File file = new File(path3+File.separator +orgname3);
			
			gallery.setOrgname3(orgname3);
			gallery.setPath3(path3);
			f3.transferTo(file);
		}
		if(!f4.isEmpty()) { //파일 업로드가 됐다면
			String orgname4 = f4.getOriginalFilename();
			String path4 = servletContext.getRealPath("/gallery");
			//System.out.println("path : "+path4);
			
			File file = new File(path4+File.separator +orgname4);
		
			gallery.setOrgname4(orgname4);
			gallery.setPath4(path4);
			f4.transferTo(file);
		}
		
       
		galleryService.addGallery(gallery);
		
		return "User/4_comm_Apply/detailGallery";
	}
	@GetMapping("/detailGallery")
	public ModelAndView detailGallery(Gallery gallery,@RequestParam int bno, 
			HttpServletRequest request) throws Exception {
	
		galleryService.plusCnt(bno);
		
			ModelAndView mav = new ModelAndView();
			
			mav.setViewName("User/4_comm_Apply/detailGallery");
			
			
			mav.addObject("gallery",galleryService.viewDetail(bno));
			
			
			return mav;

	}
	@GetMapping("/deleteGallery")
	public String deleteGallery(Gallery gallery,@RequestParam int bno, 
			Model model,GalleryPaging pagination) throws Exception {
		
			galleryService.deleteGallery(bno);
			
			model.addAttribute("galleryList", galleryService.getGallerys(pagination));
			return "User/4_comm/gallery";

	}
	@GetMapping("/downloadG")
	public void downloadFile(Gallery gallery, @RequestParam int bno,HttpServletResponse response) throws Exception {
		String orgName1=galleryService.viewDetail(bno).getOrgname1();
		String path1 = galleryService.viewDetail(bno).getPath1();

		byte fileByte[] = FileUtils.readFileToByteArray(new File(path1+"\\"+orgName1));
	
		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition", "attachment; fileName=\""+URLEncoder.encode(orgName1,"UTF-8")+"\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.getOutputStream().write(fileByte);
		
		response.getOutputStream().flush();
		response.getOutputStream().close();

		
	}
	@GetMapping("/downloadG2")
	public void downloadFile2(Gallery gallery, @RequestParam int bno,HttpServletResponse response) throws Exception {
		String orgName2=galleryService.viewDetail(bno).getOrgname2();
		String path2 = galleryService.viewDetail(bno).getPath2();

	
		byte fileByte2[] = FileUtils.readFileToByteArray(new File(path2+"\\"+orgName2));
		
		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte2.length);
		response.setHeader("Content-Disposition", "attachment; fileName=\""+URLEncoder.encode(orgName2,"UTF-8")+"\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.getOutputStream().write(fileByte2);
		
		
		response.getOutputStream().flush();
		response.getOutputStream().close();
		
	}

	@GetMapping("/downloadG3")
	public void downloadFile3(Gallery gallery, @RequestParam int bno,HttpServletResponse response) throws Exception {
		String orgName3=galleryService.viewDetail(bno).getOrgname3();
		String path3 = galleryService.viewDetail(bno).getPath3();

	
		byte fileByte3[] = FileUtils.readFileToByteArray(new File(path3+"\\"+orgName3));
		
		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte3.length);
		response.setHeader("Content-Disposition", "attachment; fileName=\""+URLEncoder.encode(orgName3,"UTF-8")+"\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.getOutputStream().write(fileByte3);
		
		
		response.getOutputStream().flush();
		response.getOutputStream().close();
		
	}
	@GetMapping("/downloadG4")
	public void downloadFile4(Gallery gallery, @RequestParam int bno,HttpServletResponse response) throws Exception {
		String orgName4=galleryService.viewDetail(bno).getOrgname4();
		String path4 = galleryService.viewDetail(bno).getPath4();

	
		byte fileByte4[] = FileUtils.readFileToByteArray(new File(path4+"\\"+orgName4));
		
		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte4.length);
		response.setHeader("Content-Disposition", "attachment; fileName=\""+URLEncoder.encode(orgName4,"UTF-8")+"\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.getOutputStream().write(fileByte4);
		
		
		response.getOutputStream().flush();
		response.getOutputStream().close();
		
	}

	/***************
	 * 서식자료실*
	 * ****************/

	@GetMapping("/formula")
	public String formula(Model model,FormulaPaging pagination,
			@RequestParam(required = false, defaultValue = "1") int page, @RequestParam(required = false, defaultValue = "1") int range) {
		
		int listCnt = formulaService.getFormulaListCnt();
		
		pagination.pageInfo(page, range, listCnt);

		model.addAttribute("pagination", pagination);
		model.addAttribute("formulaList", formulaService.getFormulas(pagination));
	
		return "User/4_comm/formula";
	}
	@GetMapping("/addFormula")
	public String addFormula() {
		return "User/4_comm_Apply/addFormula";
	}
	@PostMapping("/addFormula")
	public String addFormula(Formula formula) throws Exception{
		MultipartFile f1 = formula.getFile();
		MultipartFile f2 = formula.getFile2();
		
		if(!f1.isEmpty()) { //파일 업로드가 됐다면
			String orgname1 = f1.getOriginalFilename();
			String path1 = servletContext.getRealPath("/uploadFile");
			//System.out.println("path : "+path1);
			
			File file = new File(path1+File.separator +orgname1);
			
			formula.setOrgname1(orgname1);
			formula.setPath1(path1);
			f1.transferTo(file);
		}
		if(!f2.isEmpty()) { //파일 업로드가 됐다면
			String orgname2 = f2.getOriginalFilename();
			String path2 = servletContext.getRealPath("/uploadFile");
			//System.out.println("path : "+path2);
			
			File file = new File(path2+File.separator +orgname2);
		
			formula.setOrgname2(orgname2);
			formula.setPath2(path2);
			f2.transferTo(file);
		}		
       
		formulaService.addFormula(formula);
		
		return "User/4_comm_Apply/detailFormula";
	}
	@GetMapping("/detailFormula")
	public ModelAndView detailFormula(Formula formula,@RequestParam int bno, 
			HttpServletRequest request) throws Exception {
	
		formulaService.plusCnt(bno);
		
			ModelAndView mav = new ModelAndView();
			
			mav.setViewName("User/4_comm_Apply/detailFormula");
			
			
			mav.addObject("formula",formulaService.viewDetail(bno));
			
			
			return mav;

	}
	@GetMapping("/downloadF")
	public void downloadFile(Formula formula, @RequestParam int bno,HttpServletResponse response) throws Exception {
		String orgName1=formulaService.viewDetail(bno).getOrgname1();
		String path1 = formulaService.viewDetail(bno).getPath1();

		byte fileByte[] = FileUtils.readFileToByteArray(new File(path1+"\\"+orgName1));
	
		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition", "attachment; fileName=\""+URLEncoder.encode(orgName1,"UTF-8")+"\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.getOutputStream().write(fileByte);
		
		response.getOutputStream().flush();
		response.getOutputStream().close();

		
	}
	@GetMapping("/downloadF2")
	public void downloadFile2(Formula formula, @RequestParam int bno,HttpServletResponse response) throws Exception {
		String orgName2=formulaService.viewDetail(bno).getOrgname2();
		String path2 = formulaService.viewDetail(bno).getPath2();

	
		byte fileByte2[] = FileUtils.readFileToByteArray(new File(path2+"\\"+orgName2));
		
		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte2.length);
		response.setHeader("Content-Disposition", "attachment; fileName=\""+URLEncoder.encode(orgName2,"UTF-8")+"\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.getOutputStream().write(fileByte2);
		
		
		response.getOutputStream().flush();
		response.getOutputStream().close();
		
	}
	@GetMapping("/deleteFormula")
	public String deleteFormula(Formula formula,@RequestParam int bno, 
			Model model,FormulaPaging pagination) throws Exception {
		
			formulaService.deleteFormula(bno);
			
			model.addAttribute("formulaList", formulaService.getFormulas(pagination));
			return "User/4_comm/formula";

	}
	
	/***************
	 * 자유게시판*
	 * ****************/

	@GetMapping("/free")
	public String free(Model model,FreePaging pagination,
			@RequestParam(required = false, defaultValue = "1") int page, @RequestParam(required = false, defaultValue = "1") int range) {
		int listCnt = freeService.getFreeListCnt();
		
		pagination.pageInfo(page, range, listCnt);

		model.addAttribute("pagination", pagination);
		model.addAttribute("freeList", freeService.getFrees(pagination));
	
		return "User/4_comm/free";
	}
	@GetMapping("/addFree")
	public String addFree() {
		return "User/4_comm_Apply/addFree";
	}
	@PostMapping("/addFree")
	public String addFree(Free free) throws Exception{
		MultipartFile f1 = free.getFile1();
		MultipartFile f2 = free.getFile2();
		MultipartFile f3 = free.getFile3();
		MultipartFile f4 = free.getFile4();
		MultipartFile f5 = free.getFile5();
		
		if(!f1.isEmpty()) { //파일 업로드가 됐다면
			String orgname1 = f1.getOriginalFilename();
			String path1 = servletContext.getRealPath("/uploadFile/free");
			//System.out.println("path : "+path1);
			
			File file = new File(path1+File.separator +orgname1);
			
			free.setOrgname1(orgname1);
			free.setPath1(path1);
			f1.transferTo(file);
		}
		if(!f2.isEmpty()) { //파일 업로드가 됐다면
			String orgname2 = f2.getOriginalFilename();
			String path2 = servletContext.getRealPath("/uploadFile/free");
			//System.out.println("path : "+path2);
			
			File file = new File(path2+File.separator +orgname2);
		
			free.setOrgname2(orgname2);
			free.setPath2(path2);
			f2.transferTo(file);
		}
		if(!f3.isEmpty()) { //파일 업로드가 됐다면
			String orgname3 = f3.getOriginalFilename();
			String path3 = servletContext.getRealPath("/uploadFile/free");
			//System.out.println("path : "+path3);
			
			File file = new File(path3+File.separator +orgname3);
			
			free.setOrgname3(orgname3);
			free.setPath3(path3);
			f3.transferTo(file);
		}
		if(!f4.isEmpty()) { //파일 업로드가 됐다면
			String orgname4 = f4.getOriginalFilename();
			String path4 = servletContext.getRealPath("/uploadFile/free");
			//System.out.println("path : "+path4);
			
			File file = new File(path4+File.separator +orgname4);
		
			free.setOrgname4(orgname4);
			free.setPath4(path4);
			f4.transferTo(file);
		}
		if(!f5.isEmpty()) { //파일 업로드가 됐다면
			String orgname5 = f5.getOriginalFilename();
			String path5 = servletContext.getRealPath("/uploadFile/free");
			//System.out.println("path : "+path4);
			
			File file = new File(path5+File.separator +orgname5);
		
			free.setOrgname5(orgname5);
			free.setPath5(path5);
			f4.transferTo(file);
		}
		
       
		freeService.addFree(free);
		
		return "User/4_comm_Apply/detailFree";
	}
	@GetMapping("/detailFree")
	public ModelAndView detailFree(Free free,@RequestParam int bno, 
			HttpServletRequest request) throws Exception {
	
		freeService.plusCnt(bno);
		
			ModelAndView mav = new ModelAndView();
			
			mav.setViewName("User/4_comm_Apply/detailFree");
			
			
			mav.addObject("free",freeService.viewDetail(bno));
			
			
			return mav;

	}
	@GetMapping("/deleteFree")
	public String deleteFree(Free free,@RequestParam int bno, 
			Model model,FreePaging pagination) throws Exception {
		
		freeService.deleteFree(bno);
			
			model.addAttribute("freeList", freeService.getFrees(pagination));
			return "User/4_comm/free";

	}
	@GetMapping("/downloadFr")
	public void downloadFile(Free free, @RequestParam int bno,HttpServletResponse response) throws Exception {
		String orgName1=freeService.viewDetail(bno).getOrgname1();
		String path1 = freeService.viewDetail(bno).getPath1();

		byte fileByte[] = FileUtils.readFileToByteArray(new File(path1+"\\"+orgName1));
	
		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition", "attachment; fileName=\""+URLEncoder.encode(orgName1,"UTF-8")+"\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.getOutputStream().write(fileByte);
		
		response.getOutputStream().flush();
		response.getOutputStream().close();

		
	}
	@GetMapping("/downloadFr2")
	public void downloadFile2(Free free, @RequestParam int bno,HttpServletResponse response) throws Exception {
		String orgName2=freeService.viewDetail(bno).getOrgname2();
		String path2 = freeService.viewDetail(bno).getPath2();

	
		byte fileByte2[] = FileUtils.readFileToByteArray(new File(path2+"\\"+orgName2));
		
		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte2.length);
		response.setHeader("Content-Disposition", "attachment; fileName=\""+URLEncoder.encode(orgName2,"UTF-8")+"\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.getOutputStream().write(fileByte2);
		
		
		response.getOutputStream().flush();
		response.getOutputStream().close();
		
	}
	@GetMapping("/downloadFr3")
	public void downloadFile3(Free free, @RequestParam int bno,HttpServletResponse response) throws Exception {
		String orgName3=freeService.viewDetail(bno).getOrgname3();
		String path3 = freeService.viewDetail(bno).getPath3();

	
		byte fileByte3[] = FileUtils.readFileToByteArray(new File(path3+"\\"+orgName3));
		
		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte3.length);
		response.setHeader("Content-Disposition", "attachment; fileName=\""+URLEncoder.encode(orgName3,"UTF-8")+"\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.getOutputStream().write(fileByte3);
		
		
		response.getOutputStream().flush();
		response.getOutputStream().close();
		
	}
	@GetMapping("/downloadFr4")
	public void downloadFile4(Free free, @RequestParam int bno,HttpServletResponse response) throws Exception {
		String orgName4=freeService.viewDetail(bno).getOrgname4();
		String path4 = freeService.viewDetail(bno).getPath4();

	
		byte fileByte4[] = FileUtils.readFileToByteArray(new File(path4+"\\"+orgName4));
		
		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte4.length);
		response.setHeader("Content-Disposition", "attachment; fileName=\""+URLEncoder.encode(orgName4,"UTF-8")+"\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.getOutputStream().write(fileByte4);
		
		
		response.getOutputStream().flush();
		response.getOutputStream().close();
		
	}
	@GetMapping("/downloadFr5")
	public void downloadFile5(Free free, @RequestParam int bno,HttpServletResponse response) throws Exception {
		String orgName5=freeService.viewDetail(bno).getOrgname5();
		String path5 = freeService.viewDetail(bno).getPath5();

	
		byte fileByte4[] = FileUtils.readFileToByteArray(new File(path5+"\\"+orgName5));
		
		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte4.length);
		response.setHeader("Content-Disposition", "attachment; fileName=\""+URLEncoder.encode(orgName5,"UTF-8")+"\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.getOutputStream().write(fileByte4);
		
		
		response.getOutputStream().flush();
		response.getOutputStream().close();
		
	}
	

}
