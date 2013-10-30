package com.mj.test;

public class TicketVO {
	private String seq;
	private String title;
	private String img;
	private String imgDesc;
	private String ticketImg;
	private String price;
	private String startDate;
	private String endDate;
	private String place;
	private String area;
	private String discountRate;
	private String useCond;
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getImgDesc() {
		return imgDesc;
	}
	public void setImgDesc(String imgDesc) {
		this.imgDesc = imgDesc;
	}
	public String getTicketImg() {
		return ticketImg;
	}
	public void setTicketImg(String ticketImg) {
		this.ticketImg = ticketImg;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getDiscountRate() {
		return discountRate;
	}
	public void setDiscountRate(String discountRate) {
		this.discountRate = discountRate;
	}
	public String getUseCond() {
		return useCond;
	}
	public void setUseCond(String useCond) {
		this.useCond = useCond;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((seq == null) ? 0 : seq.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		TicketVO other = (TicketVO) obj;
		if (seq == null) {
			if (other.seq != null)
				return false;
		} else if (!seq.equals(other.seq))
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "TicketVO [seq=" + seq + ", title=" + title + ", img=" + img
				+ ", imgDesc=" + imgDesc + ", ticketImg=" + ticketImg
				+ ", price=" + price + ", startDate=" + startDate
				+ ", endDate=" + endDate + ", place=" + place + ", area="
				+ area + ", discountRate=" + discountRate + ", useCond="
				+ useCond + "]";
	}
	
	
}
