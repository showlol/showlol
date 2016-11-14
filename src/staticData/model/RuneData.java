package staticData.model;

public class RuneData {
	int id;
	String name;
	String description;
	String tier;
	String type;
	
	//=====================================================================================================
	public RuneData() {
		super();
	}

	public RuneData(int id, String name, String description, String tier, String type) {
		super();
		this.id = id;
		this.name = name;
		this.description = description;
		this.tier = tier;
		this.type = type;
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

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getTier() {
		return tier;
	}

	public void setTier(String tier) {
		this.tier = tier;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
}
