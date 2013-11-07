package ac.hansung.show.service;

import java.util.List;

public interface ShowService {
	public List<PerforListVO> showAllList(int rows, String cPage) throws Exception;
	public List<PerforListVO> searchList(int rows, String cPage, String keyword) throws Exception;
	public List<PerforListVO> showCatList(int rows, String cPage, String catVal) throws Exception;
	public List<DiscountVO> discountList(int rows, String cPage) throws Exception;
	public PlaceVO mapView(String requestPath) throws Exception;
	public PerforInfoVO showInfoView(String seq, String keyword) throws Exception;
	public String getShowSeq(String keyword) throws Exception;
	public int getListCount() throws Exception;
	public int getSearchCount(String keyword) throws Exception;
	public int getCatCount(String catVal) throws Exception;
	public int getDiscountCount() throws Exception;
}
