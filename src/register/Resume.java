package register;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "cs_resume")
public class Resume implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;
	private Integer id_user;
	private String title;
	@Column(columnDefinition = "TEXT")
	private String professional_summary;
	@Column(columnDefinition = "TEXT")
	private String technical_skills;
	@Column(columnDefinition = "TEXT")
	private String professional_experience;
	@Column(columnDefinition = "TEXT")
	private String education;
	private Integer publicc;
	private Timestamp date_created;
	@Column(nullable=true)
	private Timestamp date_last_modified;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getId_user() {
		return id_user;
	}
	public void setId_user(Integer id_user) {
		this.id_user = id_user;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getProfessional_summary() {
		return professional_summary;
	}
	public void setProfessional_summary(String professional_summary) {
		this.professional_summary = professional_summary;
	}
	public String getTechnical_skills() {
		return technical_skills;
	}
	public void setTechnical_skills(String technical_skills) {
		this.technical_skills = technical_skills;
	}
	public String getProfessional_experience() {
		return professional_experience;
	}
	public void setProfessional_experience(String professional_experience) {
		this.professional_experience = professional_experience;
	}
	public String getEducation() {
		return education;
	}
	public void setEducation(String education) {
		this.education = education;
	}
	public Integer getPublicc() {
		return publicc;
	}
	public void setPublicc(Integer publicc) {
		this.publicc = publicc;
	}
	public Timestamp getDate_created() {
		return date_created;
	}
	public void setDate_created(Timestamp date_created) {
		this.date_created = date_created;
	}
	public Timestamp getDate_last_modified() {
		return date_last_modified;
	}
	public void setDate_last_modified(Timestamp date_last_modified) {
		this.date_last_modified = date_last_modified;
	}
	
	
}
