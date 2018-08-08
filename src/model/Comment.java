package model;

import java.text.SimpleDateFormat;

public class Comment {
	private int commentId;
	private String userId;
	private String content;
	private String time;
	public Comment(int commentId, String userId, String content, Long time) {
		super();
		this.commentId = commentId;
		this.userId = userId;
		this.content = content;
		this.time = new SimpleDateFormat("yyyy.MM.dd. hh:mm").format(time);
	}
	public int getCommentId() {
		return commentId;
	}
	public String getUserId() {
		return userId;
	}
	public String getContent() {
		return content;
	}
	public String getTime() {
		return time;
	}
	public String toString() {
		return commentId+"/"+userId+"/"+content+"/"+time+"\n";
	}
}
