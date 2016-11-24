package tactics.model.pojo;

import java.util.Date;

public class ImprovedTactics {
	int num;	
	String champ;
	String writer;	
	String masteryData;
	String masteryContent;
	String runeData;
	String runeContent;
	String skillBuild;
	String skillContent;
	String itemBuild;
	String itemContent;
	int good;
	int bad;
	int hit;
	String imageLink="";
	Date writeDate;
	String title;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getChamp() {
		return champ;
	}
	public void setChamp(String champ) {
		this.champ = champ;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getMasteryData() {
		return masteryData;
	}
	public void setMasteryData(String masteryData) {
		this.masteryData = masteryData;
	}
	public String getMasteryContent() {
		return masteryContent;
	}
	public void setMasteryContent(String masteryContent) {
		this.masteryContent = masteryContent;
	}
	public String getRuneData() {
		return runeData;
	}
	public void setRuneData(String runeData) {
		this.runeData = runeData;
	}
	public String getRuneContent() {
		return runeContent;
	}
	public void setRuneContent(String runeContent) {
		this.runeContent = runeContent;
	}
	public String getSkillBuild() {
		return skillBuild;
	}
	public void setSkillBuild(String skillBuild) {
		this.skillBuild = skillBuild;
	}
	public String getSkillContent() {
		return skillContent;
	}
	public void setSkillContent(String skillContent) {
		this.skillContent = skillContent;
	}
	public String getItemBuild() {
		return itemBuild;
	}
	public void setItemBuild(String itemBuild) {
		this.itemBuild = itemBuild;
	}
	public String getItemContent() {
		return itemContent;
	}
	public void setItemContent(String itemContent) {
		this.itemContent = itemContent;
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
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	@Override
	public String toString() {
		return "ImprovedTactics [num=" + num + ", champ=" + champ + ", writer=" + writer + ", masteryData="
				+ masteryData + ", masteryContent=" + masteryContent + ", runeData=" + runeData + ", runeContent="
				+ runeContent + ", skillBuild=" + skillBuild + ", skillContent=" + skillContent + ", itemBuild="
				+ itemBuild + ", itemContent=" + itemContent + ", good=" + good + ", bad=" + bad + ", hit=" + hit
				+ ", imageLink=" + imageLink + ", writeDate=" + writeDate + ", title=" + title + "]";
	}
	
}
