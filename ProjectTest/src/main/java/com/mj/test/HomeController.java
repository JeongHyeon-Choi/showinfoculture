package com.mj.test;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathFactory;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;

@Controller
public class HomeController {
	@RequestMapping("/test.do")
	public ModelAndView home(HttpServletRequest req) throws Exception {
		List<PerforVO> perForList = new ArrayList<PerforVO>();
		ModelAndView mav = new ModelAndView();
			
		String url = "http://www.culture.go.kr/openapi/rest/publicperformancedisplays/period?ServiceKey=XcnMofgimavn4FhW9zGJndMQaq0V4LWWmRD8glJdQYNH%2F1qiatox2GY7VJXpVIcmLy35%2BIvEJiFshQbNe4CT0g%3D%3D&rows=400";
		
		String search;
		String input = req.getParameter("search");
		System.out.println("search : "+input);
		if(input != null){//encoding koreaLanguege utf-8 url
			search = "&keyword="+URLEncoder.encode(input, "utf-8");
			url=url+search;
		}
		
		Document document = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(url);
		XPath xpath = XPathFactory.newInstance().newXPath();
		
		NodeList seq = (NodeList)xpath.evaluate("//perforList/seq", document, XPathConstants.NODESET);
		NodeList title = (NodeList)xpath.evaluate("//perforList/title", document, XPathConstants.NODESET);
		NodeList startDate = (NodeList)xpath.evaluate("//perforList/startDate", document, XPathConstants.NODESET);
		NodeList endDate = (NodeList)xpath.evaluate("//perforList/endDate", document, XPathConstants.NODESET);
		NodeList place = (NodeList)xpath.evaluate("//perforList/place", document, XPathConstants.NODESET);
		NodeList realmName = (NodeList)xpath.evaluate("//perforList/realmName", document, XPathConstants.NODESET);
		NodeList area = (NodeList)xpath.evaluate("//perforList/area", document, XPathConstants.NODESET);
		NodeList thumbnail = (NodeList)xpath.evaluate("//perforList/thumbnail", document, XPathConstants.NODESET);
		
		for(int i=0; i<seq.getLength(); i++) {
			PerforVO pf = new PerforVO();
			pf.setSeq(seq.item(i).getTextContent());
			pf.setTitle(title.item(i).getTextContent());
			pf.setStartDate(startDate.item(i).getTextContent());
			pf.setEndDate(endDate.item(i).getTextContent());
			pf.setPlace(place.item(i).getTextContent());
			pf.setRealmName(realmName.item(i).getTextContent());
			pf.setArea(area.item(i).getTextContent());
			pf.setThumbnail(thumbnail.item(i).getTextContent());
			
			perForList.add(pf);
		}
		
		mav.addObject("perForList", perForList);
		mav.setViewName("home");
		
		return mav;
	}
	
	@RequestMapping("/testPlace.do")
	public ModelAndView testPlace(HttpServletRequest req) throws Exception {
//		List<PlaceVO> placeList = new ArrayList<PlaceVO>();
		ModelAndView mav = new ModelAndView();
			
		String url = "http://www.culture.go.kr/openapi/rest/cultureartspaces/performingplace?ServiceKey=XcnMofgimavn4FhW9zGJndMQaq0V4LWWmRD8glJdQYNH%2F1qiatox2GY7VJXpVIcmLy35%2BIvEJiFshQbNe4CT0g%3D%3D";

		String search;
//		String input = "종로";//req.getParameter("place");
		String input = req.getParameter("place"); // get from webbrowser direct encoding utf-8
		input = new String(input.getBytes("8859_1"), "utf-8");
		System.out.println("place : "+input);
		if(input != null){//encoding koreaLanguege utf-8 url
			search = "&keyword="+URLEncoder.encode(input, "utf-8");
			url=url+search;
		}
	
		
		Document document = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(url);
		XPath xpath = XPathFactory.newInstance().newXPath();
		
		NodeList seq = (NodeList)xpath.evaluate("//placeList/seq", document, XPathConstants.NODESET);
		NodeList culName = (NodeList)xpath.evaluate("//placeList/culName", document, XPathConstants.NODESET);
		NodeList culGrpName = (NodeList)xpath.evaluate("//placeList/culGrpName", document, XPathConstants.NODESET);
		NodeList culTel = (NodeList)xpath.evaluate("//placeList/culTel", document, XPathConstants.NODESET);
		NodeList culHomeUrl = (NodeList)xpath.evaluate("//placeList/culHomeUrl", document, XPathConstants.NODESET);
		NodeList gpsX = (NodeList)xpath.evaluate("//placeList/gpsX", document, XPathConstants.NODESET);
		NodeList gpsY = (NodeList)xpath.evaluate("//placeList/gpsY", document, XPathConstants.NODESET);
		
		

		PlaceVO pf = new PlaceVO();
		if(seq.getLength() != 0){
			pf.setSeq(seq.item(0).getTextContent());
			pf.setCulName(culName.item(0).getTextContent());
			pf.setCulGrpName(culGrpName.item(0).getTextContent());
			pf.setCulTel(culTel.item(0).getTextContent());
			pf.setCulHomeUrl(culHomeUrl.item(0).getTextContent());
			pf.setGpsX(gpsX.item(0).getTextContent());
			pf.setGpsY(gpsY.item(0).getTextContent());
		}else{
			pf = null;
		}

		mav.addObject("place", pf);
		mav.setViewName("place");
		
		return mav;
	}
	
	@RequestMapping("/testTicket.do")
	public ModelAndView testTicket(HttpServletRequest req) throws Exception {
//		List<PlaceVO> placeList = new ArrayList<PlaceVO>();
		ModelAndView mav = new ModelAndView();
			
		String url = "http://www.culture.go.kr/openapi/rest/ticketdiscounts?ServiceKey=XcnMofgimavn4FhW9zGJndMQaq0V4LWWmRD8glJdQYNH%2F1qiatox2GY7VJXpVIcmLy35%2BIvEJiFshQbNe4CT0g%3D%3D";

		String search;
//		String input = "종로";//req.getParameter("place");
		String input = req.getParameter("ticket"); // get from webbrowser direct encoding utf-8
		input = new String(input.getBytes("8859_1"), "utf-8");
		System.out.println("ticket : "+input);
		if(input != null){//encoding koreaLanguege utf-8 url
			search = "&keyword="+URLEncoder.encode(input, "utf-8");
			url=url+search;
		}
	
		
		Document document = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(url);
		XPath xpath = XPathFactory.newInstance().newXPath();
		
		NodeList seq = (NodeList)xpath.evaluate("//ticketList/seq", document, XPathConstants.NODESET);
		NodeList title = (NodeList)xpath.evaluate("//ticketList/title", document, XPathConstants.NODESET);
		NodeList img = (NodeList)xpath.evaluate("//ticketList/img", document, XPathConstants.NODESET);
		NodeList imgDesc = (NodeList)xpath.evaluate("//ticketList/imgDesc", document, XPathConstants.NODESET);
		NodeList ticketImg = (NodeList)xpath.evaluate("//ticketList/ticketImg", document, XPathConstants.NODESET);
		NodeList price = (NodeList)xpath.evaluate("//ticketList/price", document, XPathConstants.NODESET);
		NodeList startDate = (NodeList)xpath.evaluate("//ticketList/startDate", document, XPathConstants.NODESET);
		NodeList endDate = (NodeList)xpath.evaluate("//ticketList/endDate", document, XPathConstants.NODESET);
		NodeList place = (NodeList)xpath.evaluate("//ticketList/place", document, XPathConstants.NODESET);
		NodeList area = (NodeList)xpath.evaluate("//ticketList/area", document, XPathConstants.NODESET);
		NodeList discountRate = (NodeList)xpath.evaluate("//ticketList/discountRate", document, XPathConstants.NODESET);
		NodeList useCond = (NodeList)xpath.evaluate("//ticketList/useCond", document, XPathConstants.NODESET);
		

		TicketVO pf = new TicketVO();
		if(seq.getLength() != 0){
			pf.setSeq(seq.item(0).getTextContent());
			pf.setTitle(title.item(0).getTextContent());
			pf.setImg(img.item(0).getTextContent());
			pf.setImgDesc(imgDesc.item(0).getTextContent());
			pf.setTicketImg(ticketImg.item(0).getTextContent());
			pf.setPrice(price.item(0).getTextContent());
			pf.setStartDate(startDate.item(0).getTextContent());
			pf.setEndDate(endDate.item(0).getTextContent());
			pf.setPlace(place.item(0).getTextContent());
			pf.setArea(area.item(0).getTextContent());
			pf.setDiscountRate(discountRate.item(0).getTextContent());
			pf.setUseCond(useCond.item(0).getTextContent());
		}else{
			pf = null;
		}

		mav.addObject("ticket", pf);
		mav.setViewName("ticket");
		
		return mav;
	}
	
}
