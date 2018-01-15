package register;

public class ResumePublic {
	private Integer id = new Integer(0);
	private String name = new String();
	private String title = new String();
	private String datec  = new String();
	private String cdatec  = new String();
	private String datem = new String();
	private String cdatem = new String();
	
	ResumePublic(int id, String name, String title, String datec, String cdatec, String datem, String cdatem){
		this.id = id;
		this.name = name;
		this.title = title;
		this.datec = datec;
		this.cdatec = cdatec;
		this.datem = datem;
		this.cdatem = cdatem;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
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

	public String getDatec() {
		return datec;
	}

	public void setDatec(String datec) {
		this.datec = datec;
	}

	public String getCdatec() {
		return cdatec;
	}

	public void setCdatec(String cdatec) {
		this.cdatec = cdatec;
	}

	public String getDatem() {
		return datem;
	}

	public void setDatem(String datem) {
		this.datem = datem;
	}

	public String getCdatem() {
		return cdatem;
	}

	public void setCdatem(String cdatem) {
		this.cdatem = cdatem;
	}
}
