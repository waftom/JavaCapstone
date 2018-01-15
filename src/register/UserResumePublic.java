package register;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserResumePublic {
	private List<ResumePublic> urpublic = new ArrayList<>();
	
	UserResumePublic(ResultSet result){
		try {
			while (result.next()) {
				
				Integer id = result.getInt("id");
				String name = result.getString("fname") + " " + result.getString("lname");
				String title = result.getString("title");
				String datec  = result.getString("date_created");
				String cdatec  = result.getString("c_date_created");
				String datem = result.getString("date_last_modified");
				if(datem == null) datem = "-";
				String cdatem = result.getString("c_date_last_modified");

				ResumePublic rpublic = new ResumePublic(id, name, title, datec, cdatec, datem, cdatem);

				urpublic.add(rpublic);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public List<ResumePublic> getUrpublic() {
		return urpublic;
	}

	public void setUrpublic(List<ResumePublic> urlist) {
		this.urpublic = urlist;
	}
}
