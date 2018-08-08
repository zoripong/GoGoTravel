package model;

public class Detail {
	int travelId;
	int routeId;
	int detailIndex;
	String imageSrc;
	String content;
	
	public Detail(int travelId, int routeId, int detailIndex, String imageSrc, String content) {
		super();
		this.travelId = travelId;
		this.routeId = routeId;
		this.detailIndex = detailIndex;
		this.imageSrc = imageSrc;
		this.content = content;
	}
	
	public int getTravelId() {
		return travelId;
	}
	public int getRouteId() {
		return routeId;
	}
	public int getDetailIndex() {
		return detailIndex;
	}
	public String getImageSrc() {
		return imageSrc;
	}
	public String getContent() {
		return content;
	}
	
	public String toString() {
		return travelId+"/"+routeId+"/"+detailIndex+"/"+imageSrc+"/"+content+"\n";
	}
}
