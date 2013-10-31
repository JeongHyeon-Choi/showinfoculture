package ac.hansung.show.controller;

import java.net.URLEncoder;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ac.hansung.show.service.DiscountVO;
import ac.hansung.show.service.Page;
import ac.hansung.show.service.PerforInfoVO;
import ac.hansung.show.service.PerforListVO;
import ac.hansung.show.service.PlaceVO;
import ac.hansung.show.service.ShowService;

@Controller
public class ShowController {
	@Resource
	Page page;
	@Resource
	ShowService showService;
	
	@RequestMapping("/list.do")
	public ModelAndView showAllList(HttpServletRequest req) throws Exception {
		int rows = 16;
		int pageBlock = 10;
		String path = "list.do";
		String pageCode;
		String cPage = req.getParameter("cPage");
		ModelAndView mav = new ModelAndView();
		
		if(cPage == null)
			cPage = "1";
		
		List<PerforListVO> perForList = showService.showAllList(rows, cPage);
		
		page.setPageInit(Integer.parseInt(cPage), showService.getListCount(), rows, pageBlock, path);
		pageCode = page.getSb().toString();
		
		mav.addObject("perForList", perForList);
		mav.addObject("pageCode", pageCode);
		mav.addObject("cPage", cPage);
		
		mav.setViewName("showList");
		
		return mav;
	}
	
	@RequestMapping("/catShow.do")
	public ModelAndView showCatList(HttpServletRequest req) throws Exception {
		int rows = 16;
		int pageBlock = 10;
		String catVal = req.getParameter("catVal");
		String realmCode = null;
		String path = "catShow.do";
		String pageCode;
		String cPage = req.getParameter("cPage");
		ModelAndView mav = new ModelAndView();
		
		if(cPage == null)
			cPage = "1";
		
		if(catVal != null) {
			req.getSession().setAttribute("catVal", catVal);
		}
		
		if(req.getSession().getAttribute("catVal") != null) {
			catVal = (String)req.getSession().getAttribute("catVal");
			realmCode = "&realmCode=" + URLEncoder.encode(catVal, "utf-8");
		}
		
		List<PerforListVO> perForList = showService.showCatList(rows, cPage, realmCode);
		
		page.setPageInit(Integer.parseInt(cPage), showService.getCatCount(catVal), rows, pageBlock, path);
		pageCode = page.getSb().toString();
		
		mav.addObject("perForList", perForList);
		mav.addObject("pageCode", pageCode);
		mav.addObject("cPage", cPage);
		
		mav.setViewName("showList");
		
		return mav;
	}
	
	@RequestMapping("/discountList.do")
	public ModelAndView discountList(HttpServletRequest req) throws Exception {
		int rows = 16;
		int pageBlock = 10;
		String path = "discountList.do";
		String pageCode;
		String cPage = req.getParameter("cPage");
		ModelAndView mav = new ModelAndView();
		
		if(cPage == null)
			cPage = "1";
		
		List<DiscountVO> disCountList = showService.discountList(rows, cPage);
		
		page.setPageInit(Integer.parseInt(cPage), showService.getDiscountCount(), rows, pageBlock, path);
		pageCode = page.getSb().toString();
		
		mav.addObject("disCountList", disCountList);
		mav.addObject("pageCode", pageCode);
		mav.addObject("cPage", cPage);
		
		mav.setViewName("discountList");
		
		return mav;
	}
	
	@RequestMapping("/search.do")
	public ModelAndView searchList(HttpServletRequest req) throws Exception {
		int rows = 16;
		int pageBlock = 10;
		String path = "search.do";
		String pageCode;
		String keyword = null;
		String search = req.getParameter("search");
		String cPage = req.getParameter("cPage");
		ModelAndView mav = new ModelAndView();
		
		if(cPage == null)
			cPage = "1";
			
		if(search != null) {
			req.getSession().setAttribute("search", search);
		}
		
		if(req.getSession().getAttribute("search") != null) {
			search = (String)req.getSession().getAttribute("search");
			keyword = "&keyword=" + URLEncoder.encode(search, "utf-8");
		}
		
		List<PerforListVO> perForList = showService.searchList(rows, cPage, keyword);
		
		page.setPageInit(Integer.parseInt(cPage), showService.getSearchCount(keyword), rows, pageBlock, path);
		pageCode = page.getSb().toString();
		
		mav.addObject("perForList", perForList);
		mav.addObject("pageCode", pageCode);
		mav.addObject("cPage", cPage);
		
		mav.setViewName("showList");
		
		return mav;
	}
	
	@RequestMapping("/read.do")
	public ModelAndView showInfo(HttpServletRequest req) throws Exception {
		ModelAndView mav = new ModelAndView();
		String address = null;
		String keyword = null;
		String seq = req.getParameter("seq");
		String mapPlace = req.getParameter("place");
		String title = req.getParameter("title");
	
		mapPlace = new String(mapPlace.getBytes("8859_1"), "utf-8");
		title = new String(title.getBytes("8859_1"), "utf-8");
		
		if(mapPlace != null) {
			address = "&keyword=" + URLEncoder.encode(mapPlace, "utf-8");
		}
		
		if(title != null) {
			keyword = "&keyword=" + URLEncoder.encode(title, "utf-8");
		}
		
		PlaceVO pf = showService.mapView(address);
		PerforInfoVO pfi = showService.showInfoView(seq, keyword);
	
		mav.addObject("perForInfo", pfi);
		mav.addObject("place", pf);
		
		mav.setViewName("showInfo");
		
		return mav;
	}
}
