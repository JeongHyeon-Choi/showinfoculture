package ac.hansung.show.service;

import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathFactory;

import org.springframework.stereotype.Service;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;

@Service
public class ShowServiceImpl implements ShowService {
//	모든 공연의 List를 출력하는 메소드

	@Override
	public List<PerforListVO> showAllList(int rows, String cPage) throws Exception {
//		모든 공연 List를 담아 올 List
		List<PerforListVO> perForList = new ArrayList<PerforListVO>();
		
//		모든 공연 List가 보여질 xml의 Url 주소
		String url = "http://www.culture.go.kr/openapi/rest/publicperformancedisplays/period?"
				+ "ServiceKey=" + Utilty.getApiKey() + "&rows=" + rows + "&cPage=" + cPage;
		
		System.out.println(Utilty.getApiKey());
		
//		XPath 클래스로 받아온 xml 파싱 및 element의 값 얻어옴
		Document document = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(url);
		XPath xpath = XPathFactory.newInstance().newXPath();
		
		String count = (String) xpath.evaluate("//msgBody/totalCount", document, XPathConstants.STRING);
		NodeList seq = (NodeList)xpath.evaluate("//perforList/seq", document, XPathConstants.NODESET);
		NodeList title = (NodeList)xpath.evaluate("//perforList/title", document, XPathConstants.NODESET);
		NodeList place = (NodeList)xpath.evaluate("//perforList/place", document, XPathConstants.NODESET);
		NodeList realmName = (NodeList)xpath.evaluate("//perforList/realmName", document, XPathConstants.NODESET);
		NodeList thumbnail = (NodeList)xpath.evaluate("//perforList/thumbnail", document, XPathConstants.NODESET);
		
//		공연 List가 담길 VO에 값을 저장하고 List에 추가
		for(int i=0; i<seq.getLength(); i++) {
			PerforListVO pfl = new PerforListVO();
			pfl.setCount(count);
			pfl.setSeq(seq.item(i).getTextContent());
			pfl.setTitle(title.item(i).getTextContent());
			pfl.setPlace(place.item(i).getTextContent());
			pfl.setRealmName(realmName.item(i).getTextContent());
			pfl.setThumbnail(thumbnail.item(i).getTextContent());
			perForList.add(pfl);
		}
		
		return perForList;
	}
	
//	카테고리에 따른 공연 List를 가져오는 메소드
	@Override
	public List<PerforListVO> showCatList(int rows, String cPage, String realmCode)
			throws Exception {
//		카테고리에 따른 공연 List를 담기 위한 List
		List<PerforListVO> perForList = new ArrayList<PerforListVO>();
		
//		카테고리에 따른 공연 List가 보여질 xml의 주소 Url
		String url = "http://www.culture.go.kr/openapi/rest/publicperformancedisplays/realm?"
				+ "ServiceKey=" + Utilty.getApiKey()+ "&rows=" + rows + "&cPage=" + cPage + realmCode;
		
		Document document = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(url);
		XPath xpath = XPathFactory.newInstance().newXPath();
		
		String count = (String) xpath.evaluate("//msgBody/totalCount", document, XPathConstants.STRING);
		NodeList seq = (NodeList)xpath.evaluate("//perforList/seq", document, XPathConstants.NODESET);
		NodeList title = (NodeList)xpath.evaluate("//perforList/title", document, XPathConstants.NODESET);
		NodeList place = (NodeList)xpath.evaluate("//perforList/place", document, XPathConstants.NODESET);
		NodeList realmName = (NodeList)xpath.evaluate("//perforList/realmName", document, XPathConstants.NODESET);
		NodeList thumbnail = (NodeList)xpath.evaluate("//perforList/thumbnail", document, XPathConstants.NODESET);
		
		for(int i=0; i<seq.getLength(); i++) {
			PerforListVO pfl = new PerforListVO();
			pfl.setCount(count);
			pfl.setSeq(seq.item(i).getTextContent());
			pfl.setTitle(title.item(i).getTextContent());
			pfl.setPlace(place.item(i).getTextContent());
			pfl.setRealmName(realmName.item(i).getTextContent());
			pfl.setThumbnail(thumbnail.item(i).getTextContent());
			perForList.add(pfl);
		}
		
		return perForList;
	}
	
//	할인 되는 공연 List를 가져오는 메소드
	@Override
	public List<DiscountVO> discountList(int rows, String cPage) throws Exception {
//		할인 되는 공연 List가 담길 List
		List<DiscountVO> discountList = new ArrayList<DiscountVO>();
		
//		할인 되는 공연 List가 보여질 xml의 Url
		String url = "http://www.culture.go.kr/openapi/rest/ticketdiscounts?"
				+ "ServiceKey="+Utilty.getApiKey();
		
		Document document = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(url);
		XPath xpath = XPathFactory.newInstance().newXPath();
		
		String count = (String) xpath.evaluate("//msgBody/totalCount", document, XPathConstants.STRING);
		NodeList seq = (NodeList)xpath.evaluate("//ticketList/seq", document, XPathConstants.NODESET);
		NodeList title = (NodeList)xpath.evaluate("//ticketList/title", document, XPathConstants.NODESET);
		NodeList img = (NodeList)xpath.evaluate("//ticketList/img", document, XPathConstants.NODESET);
		NodeList place = (NodeList)xpath.evaluate("//ticketList/place", document, XPathConstants.NODESET);
		
		 for(int i=0; i<seq.getLength(); i++) {
			DiscountVO dis = new DiscountVO();
			dis.setCount(count);
			dis.setSeq(seq.item(i).getTextContent());
			dis.setTitle(title.item(i).getTextContent());
			dis.setImg(img.item(i).getTextContent());
			dis.setPlace(place.item(i).getTextContent());
			discountList.add(dis);
		} 
		
		return discountList;
	}
	
//	검색 keyword에 따른 공연 List를 가져오기 위한 메소드
	@Override
	public List<PerforListVO> searchList(int rows, String cPage, String keyword) throws Exception {
//		검색 keyword에 따른 공연 List가 담길 List
		List<PerforListVO> perForList = new ArrayList<PerforListVO>();
		
//		검색 keyword에 따른 공연 List가 보여질 xml의 Url
		String url = "http://www.culture.go.kr/openapi/rest/publicperformancedisplays/period?"
				+ "ServiceKey=" + Utilty.getApiKey() + "&rows=" + rows + "&cPage=" + cPage + keyword;
		
		Document document = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(url);
		XPath xpath = XPathFactory.newInstance().newXPath();
		
		String count = (String) xpath.evaluate("//msgBody/totalCount", document, XPathConstants.STRING);
		NodeList seq = (NodeList)xpath.evaluate("//perforList/seq", document, XPathConstants.NODESET);
		NodeList title = (NodeList)xpath.evaluate("//perforList/title", document, XPathConstants.NODESET);
		NodeList place = (NodeList)xpath.evaluate("//perforList/place", document, XPathConstants.NODESET);
		NodeList thumbnail = (NodeList)xpath.evaluate("//perforList/thumbnail", document, XPathConstants.NODESET);
		
		for(int i=0; i<seq.getLength(); i++) {
			PerforListVO pfl = new PerforListVO();
			pfl.setCount(count);
			pfl.setSeq(seq.item(i).getTextContent());
			pfl.setTitle(title.item(i).getTextContent());
			pfl.setPlace(place.item(i).getTextContent());
			pfl.setThumbnail(thumbnail.item(i).getTextContent());
			perForList.add(pfl);
		}
		
		return perForList;
	}
	
//	맵 정보를 가져오기 위한 메소드
	@Override
	public PlaceVO mapView(String address) throws Exception {
//		공연 장소에 대한 정보가 보여질 xml의 Url
		String mapUrl = "http://www.culture.go.kr/openapi/rest/cultureartspaces/performingplace?"
				+ "ServiceKey=XcnMofgimavn4FhW9zGJndMQaq0V4LWWmRD8glJdQYNH%2F1qiatox2GY7VJXpVIcmLy35%2BIvEJiFshQbNe4CT0g%3D%3D";
		
//		공연에 따른 공연 장소를 xml의 Url에 추가
		mapUrl = mapUrl + address;
		
		Document mapDocument = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(mapUrl);
		XPath xpath = XPathFactory.newInstance().newXPath();
		
		NodeList culName = (NodeList)xpath.evaluate("//placeList/culName", mapDocument, XPathConstants.NODESET);
		NodeList gpsX = (NodeList)xpath.evaluate("//placeList/gpsX", mapDocument, XPathConstants.NODESET);
		NodeList gpsY = (NodeList)xpath.evaluate("//placeList/gpsY", mapDocument, XPathConstants.NODESET);
		
		PlaceVO pf = new PlaceVO();
		
//		공연 장소에 대한 정보를 VO에 담아 옴
		if (culName.getLength() != 0) {
			pf.setCulName(culName.item(0).getTextContent());
			pf.setGpsX(gpsX.item(0).getTextContent());
			pf.setGpsY(gpsY.item(0).getTextContent());
		} else {
			pf = null;
		}
		
		return pf;
	}
	
//	할인 되는 seq값을 통해 할인 되는 공연의 정보를 가져오기 위한 메소드
	@Override
	public PerforInfoVO showInfoView(String seq, String keyword) throws Exception {
//		공연 seq에 따른 공연 정보를 보여주기 위한 xml의 Url
		String showUrl = "http://www.culture.go.kr/openapi/rest/publicperformancedisplays/d/?"
				+ "seq=" + seq + "&ServiceKey=" + Utilty.getApiKey();
//		공연 제목에 따른 할인 정보를 보여주기 위한 xml의 Url
		String disUrl = "http://www.culture.go.kr/openapi/rest/ticketdiscounts?ServiceKey=" + Utilty.getApiKey() + keyword;
		
		Document showDocument = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(showUrl);
		Document disDocument = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(disUrl);
		XPath xpath = XPathFactory.newInstance().newXPath();
		
		String title = (String)xpath.evaluate("//perforInfo/title", showDocument, XPathConstants.STRING);
		String startDate = (String)xpath.evaluate("//perforInfo/startDate", showDocument, XPathConstants.STRING);
		String endDate = (String)xpath.evaluate("//perforInfo/endDate", showDocument, XPathConstants.STRING);
		String place = (String)xpath.evaluate("//perforInfo/place", showDocument, XPathConstants.STRING);
		String realmName = (String)xpath.evaluate("//perforInfo/realmName", showDocument, XPathConstants.STRING);
		String price = (String)xpath.evaluate("//perforInfo/price", showDocument, XPathConstants.STRING);
		String contents1 = (String)xpath.evaluate("//perforInfo/contents1", showDocument, XPathConstants.STRING);
		String bookUrl = (String)xpath.evaluate("//perforInfo/url", showDocument, XPathConstants.STRING);
		String phone = (String)xpath.evaluate("//perforInfo/phone", showDocument, XPathConstants.STRING);
		String imgUrl = (String)xpath.evaluate("//perforInfo/imgUrl", showDocument, XPathConstants.STRING);
		String ticketImg = (String)xpath.evaluate("//ticketList/ticketImg", disDocument, XPathConstants.STRING);
		String discountRate = (String)xpath.evaluate("//ticketList/discountRate", disDocument, XPathConstants.STRING);
		
//		공연 정보를 VO에 담아 옴
		PerforInfoVO pfi = new PerforInfoVO();
		pfi.setTitle(title);
		pfi.setStartDate(startDate);
		pfi.setEndDate(endDate);
		pfi.setPlace(place);
		pfi.setRealmName(realmName);
		pfi.setPrice(price);
		pfi.setContents1(contents1);
		pfi.setBookUrl(bookUrl);
		pfi.setPhone(phone);
		pfi.setImgUrl(imgUrl);
		pfi.setTicketImg(ticketImg);
		pfi.setDiscountRate(discountRate);
		
		return pfi;
	}
	
//	모든 공연의 수를 가져오는 메소드
	@Override
	public int getListCount() throws Exception {
//		모든 공연 List를 가져오기 위한 xml의 Url
		String url = "http://www.culture.go.kr/openapi/rest/publicperformancedisplays/period?"
				+ "ServiceKey=" + Utilty.getApiKey();
		
		Document document = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(url);
		XPath xpath = XPathFactory.newInstance().newXPath();
		
		String stringCount = (String) xpath.evaluate("//msgBody/totalCount", document, XPathConstants.STRING);
		int count = Integer.parseInt(stringCount);
		
		return count;
	}
	
//	공연 검색 시 검색 되는 공연의 수를 가져오기 위한 메소드
	@Override
	public int getSearchCount(String keyword) throws Exception {
//		검색 keyword에 따른 공연의 List를 보여주기 위한 xml의 Url
		String url = "http://www.culture.go.kr/openapi/rest/publicperformancedisplays/period?"
				+ "ServiceKey=" + Utilty.getApiKey() + keyword;
		
		Document document = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(url);
		XPath xpath = XPathFactory.newInstance().newXPath();
		
		String stringCount = (String) xpath.evaluate("//msgBody/totalCount", document, XPathConstants.STRING);
		int count = Integer.parseInt(stringCount);
		
		return count;
	}
	
//	카테고리에 따른 공연의 수를 가져오기 위한 메소드
	@Override
	public int getCatCount(String catVal) throws Exception {
//		카테고리에 따른 공연의 List를 보여주기 위한 xml의 Url
		String url = "http://www.culture.go.kr/openapi/rest/publicperformancedisplays/realm?"
				+"ServiceKey=" + Utilty.getApiKey() + "&realmCode=" + catVal;
		
		Document document = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(url);
		XPath xpath = XPathFactory.newInstance().newXPath();
		
		String stringCount = (String) xpath.evaluate("//msgBody/totalCount", document, XPathConstants.STRING);
		int count = Integer.parseInt(stringCount);
		
		return count;
	}
	
//	할인 되는 공연의 수를 가져오기 위한 메소드
	@Override
	public int getDiscountCount() throws Exception {
//		할인 되는 공연 List를 보여주기 위한 xml의 Url
		String url = "http://www.culture.go.kr/openapi/rest/ticketdiscounts?"
				+ "ServiceKey=" + Utilty.getApiKey();
		
		Document document = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(url);
		XPath xpath = XPathFactory.newInstance().newXPath();
		
		String stringCount = (String) xpath.evaluate("//msgBody/totalCount", document, XPathConstants.STRING);
		int count = Integer.parseInt(stringCount);
		
		return count;
	}
	
//	할인 되는 공연의 제목에 따라 공연 정보의 seq 값을 얻기 위한 메소드
	@Override
	public String getShowSeq(String keyword) throws Exception {
//		할인 되는 공연의 제목에 따라 공연 정보를 보여주기 위한 xml의 Url
		String url = "http://www.culture.go.kr/openapi/rest/publicperformancedisplays/period?"
				+ "ServiceKey=" + Utilty.getApiKey() + keyword;
		
		Document document = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(url);
		XPath xpath = XPathFactory.newInstance().newXPath();
		
		String seq = (String)xpath.evaluate("//perforList/seq", document, XPathConstants.STRING);
		
		return seq;
	}
}
