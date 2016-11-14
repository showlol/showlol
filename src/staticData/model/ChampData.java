package staticData.model;

public class ChampData {
	int id;
	String key;
	String name;
	String title;
	String image1;
	String image2;
	
	//=====================================================================================================
	public ChampData() {
		super();
	}

	public ChampData(int id, String key, String name, String title, String image1, String image2) {
		super();
		this.id = id;
		this.key = key;
		this.name = name;
		this.title = title;
		this.image1 = image1;
		this.image2 = image2;
	}
	//=====================================================================================================
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getImage1() {
		return image1;
	}
	public void setImage1(String image1) {
		this.image1 = image1;
	}
	public String getImage2() {
		return image2;
	}
	public void setImage2(String image2) {
		this.image2 = image2;
	}
}
