package register;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import access.PreparedConnDBCP;

/**
 * Servlet implementation class ServletResume
 */
@WebServlet("/resumesave")
public class ServletResumeSave extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletResumeSave() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		
		String[] sess = (String[]) session.getAttribute("id");
		Integer id_user = Integer.valueOf(sess[0]);
		String save_only = new String(request.getParameter("save_only"));
		String title = new String(request.getParameter("title"));
		Integer publicc = new Integer(0);
		if(request.getParameter("public") == null) publicc = 0;
		else publicc = 1;
		String ps = new String(request.getParameter("professional_summary"));
		String ts = new String(request.getParameter("technical_skills"));
		String pe = new String(request.getParameter("professional_experience"));
		String ed = new String(request.getParameter("education"));

		String msg = new String();
		String psql;

		PreparedConnDBCP conn = new PreparedConnDBCP();
		
		String url = new String();
		
		try {
			int run = 0;

			psql = "USE capstone";
			run = conn.executeUpdate(psql, new String[] {});
			
			if (request.getParameter("id_res") == null) {
				psql = "INSERT INTO cs_resume (id_user, title, professional_summary, technical_skills, professional_experience, education, publicc, date_created)"
						+ "VALUES (?, ?, ?, ?, ?, ?, ?, NOW());";
					
				run = conn.executeUpdate(psql, new Integer(id_user).toString(), title, ps, ts, pe, ed, new Integer(publicc).toString());
				msg = "Saved successfully";
				
				if(save_only.equals("y")){
					psql = "SELECT id FROM cs_resume WHERE id_user = ? ORDER BY id DESC LIMIT 1";
					ResultSet result = conn.executeQuery(psql, new Integer(id_user).toString());
					
					while (result.next()) {
						url = "/resume?id="+result.getInt("id");
					}
				} else {
					url = "/resumelist";
				}
			} else {
				String id_res = new String(request.getParameter("id_res"));
				
				psql = "UPDATE cs_resume SET title = ?, professional_summary = ?, technical_skills = ?, "
						+ "professional_experience = ?, education = ?, publicc = ?, date_last_modified = NOW() WHERE id = ? and id_user = ?";
					
				run = conn.executeUpdate(psql, title, ps, ts, pe, ed, new Integer(publicc).toString(), id_res, new Integer(id_user).toString());
				msg = "Updated successfully";
				
				if(save_only.equals("y")){
					url = "/resume?id="+id_res;
				} else {
					url = "/resumelist";
				}
			}
			
			conn.closeDB();

			request.setAttribute("msgr", msg);
			ServletContext sc = getServletContext();
			RequestDispatcher rd = sc.getRequestDispatcher(url);
			rd.forward(request, response);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
