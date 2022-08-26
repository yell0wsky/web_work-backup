package test.cafeC.dto;

public class ComDto {
	int boardnum;
	String content;
	String	id;
	String regdate;
	int commentnum;
	
	public ComDto(){}

	public ComDto(int boardnum, String content, String id, String regdate, int commentnum) {
		super();
		this.boardnum = boardnum;
		this.content = content;
		this.id = id;
		this.regdate = regdate;
		this.commentnum = commentnum;
	}

	public int getBoardnum() {
		return boardnum;
	}

	public void setBoardnum(int boardnum) {
		this.boardnum = boardnum;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getCommentnum() {
		return commentnum;
	}

	public void setCommentnum(int commentnum) {
		this.commentnum = commentnum;
	};
	
	
}
