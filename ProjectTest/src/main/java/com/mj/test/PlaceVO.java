package com.mj.test;

public class PlaceVO {

	private String seq;
	private String culName;
	private String culGrpName;
	private String culTel;
	private String culHomeUrl;
	private String gpsX;
	private String gpsY;
	
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getCulName() {
		return culName;
	}
	public void setCulName(String culName) {
		this.culName = culName;
	}
	public String getCulGrpName() {
		return culGrpName;
	}
	public void setCulGrpName(String culGrpName) {
		this.culGrpName = culGrpName;
	}
	public String getCulTel() {
		return culTel;
	}
	public void setCulTel(String culTel) {
		this.culTel = culTel;
	}
	public String getCulHomeUrl() {
		return culHomeUrl;
	}
	public void setCulHomeUrl(String culHomeUrl) {
		this.culHomeUrl = culHomeUrl;
	}
	public String getGpsX() {
		return gpsX;
	}
	public void setGpsX(String gpsX) {
		this.gpsX = gpsX;
	}
	public String getGpsY() {
		return gpsY;
	}
	public void setGpsY(String gpsY) {
		this.gpsY = gpsY;
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
		PlaceVO other = (PlaceVO) obj;
		if (seq == null) {
			if (other.seq != null)
				return false;
		} else if (!seq.equals(other.seq))
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "PlaceVO [seq=" + seq + ", culName=" + culName + ", culGrpName="
				+ culGrpName + ", culTel=" + culTel + ", culHomeUrl="
				+ culHomeUrl + ", gpsX=" + gpsX + ", gpsY=" + gpsY + "]";
	}
	
}
