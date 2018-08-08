package model;

public class RouteDetail {
	private int detailIndex;
	private String userId;
	private String imageSrc;
	private String content;
	
	public RouteDetail(int detailIndex, String userId, String imageSrc, String content) {
		super();
		this.detailIndex = detailIndex;
		this.userId = userId;
		this.imageSrc = imageSrc;
		this.content = content;
	}

	public int getDetailIndex() {
		return detailIndex;
	}

	public String getUserId() {
		return userId;
	}

	public String getImageSrc() {
		return imageSrc;
	}

	public String getContent() {
		return content;
	}
	
	public String toString() {
		return detailIndex+"/"+userId+"/"+imageSrc+"/"+content+"\n";
	}
	
}
