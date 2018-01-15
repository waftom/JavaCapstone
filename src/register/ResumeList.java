package register;

public class ResumeList {
	private Integer id = new Integer(0);
	private String title = new String();
	private String publ = new String();
	private String datec  = new String();
	private String cdatec  = new String();
	private String datem = new String();
	private String cdatem = new String();
	
	ResumeList(int id, String title, String publ, String datec, String cdatec, String datem, String cdatem){
		this.id = id;
		this.title = title;
		this.publ = publ;
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPubl() {
		return publ;
	}

	public void setPubl(String publ) {
		this.publ = publ;
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
