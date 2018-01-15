package register;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserResumeList {
	private List<ResumeList> urlist = new ArrayList<>();
	
	UserResumeList(ResultSet result){
		try {
			while (result.next()) {
				
				Integer id = result.getInt("id");
				String title = result.getString("title");
				String publ = result.getString("publicc");
				if(publ.equals("0")) publ = "No"; else publ = "Yes"; 
				String datec  = result.getString("date_created");
				String cdatec  = result.getString("c_date_created");
				String datem = result.getString("date_last_modified");
				if(datem == null) datem = "-";
				String cdatem = result.getString("c_date_last_modified");

				ResumeList rlist = new ResumeList(id, title, publ, datec, cdatec, datem, cdatem);

				urlist.add(rlist);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public List<ResumeList> getUrlist() {
		return urlist;
	}

	public void setUrlist(List<ResumeList> urlist) {
		this.urlist = urlist;
	}
}
