package staticData.model;

public class SpellData {
	int id;
	String name;
	String description;
	String key;
	//=====================================================================================================
	public SpellData() {
		super();
	}

	public SpellData(int id, String name, String description, String key) {
		super();
		this.id = id;
		this.name = name;
		this.description = description;
		this.key = key;
	}
	//=====================================================================================================

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}
	
	public String getKey() {
		return key;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
	public void setKey(String key) {
		this.key = key;
	}
	
}
