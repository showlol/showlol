package tactics.model.pojo;

import java.util.Date;

public class Tactics {
	int num;	
	int champ;
	String writer;	
	String content1;
	String content2="";
	String skill="";
	String item="";
	int good;
	int bad;
	String imageLink="";
	Date writeDate;
	String title;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getChamp() {
		return champ;
	}
	public void setChamp(int champ) {
		this.champ = champ;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent1() {
		return content1;
	}
	public void setContent1(String content1) {
		this.content1 = content1;
	}
	public String getContent2() {
		return content2;
	}
	public void setContent2(String content2) {
		this.content2 = content2;
	}
	public String getSkill() {
		return skill;
	}
	public void setSkill(String skill) {
		this.skill = skill;
	}
	public String getItem() {
		return item;
	}
	public void setItem(String item) {
		this.item = item;
	}
	public int getGood() {
		return good;
	}
	public void setGood(int good) {
		this.good = good;
	}
	public int getBad() {
		return bad;
	}
	public void setBad(int bad) {
		this.bad = bad;
	}
	public String getImageLink() {
		return imageLink;
	}
	public void setImageLink(String imageLink) {
		this.imageLink = imageLink;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}	
	
	
}
