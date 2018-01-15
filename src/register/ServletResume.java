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
@WebServlet("/resume")
public class ServletResume extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletResume() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		
		if (session == null) {
			request.setAttribute("msg", "Lost Session!");
			ServletContext sc = getServletContext();
			RequestDispatcher rd = sc.getRequestDispatcher("/index.jsp");
			rd.forward(request, response);
		} else {
			if (request.getParameter("id") == null) {
				ServletContext sc = getServletContext();
				RequestDispatcher rd = sc.getRequestDispatcher("/resume_new.jsp");
				rd.forward(request, response);
			} else {
				String id_resume = new String(request.getParameter("id"));
				
				String[] sess = (String[]) session.getAttribute("id");
				String id_user = sess[0];
				
				String url = "/resume_edit.jsp";
		
				try {
					PreparedConnDBCP conn = new PreparedConnDBCP();
					
					String psql;
					ResultSet result = null;
					
					int run = 0;
		
					psql = "USE capstone";
					run = conn.executeUpdate(psql, new String[] {});
					
					psql = "SELECT id, title, professional_summary, technical_skills, professional_experience, education, publicc,"
							+ "DATE_FORMAT(date_created, '%m/%d/%Y %H:%m:%s') AS 'date_created', "
							+ "DATE_FORMAT(date_last_modified, '%m/%d/%Y %H:%m:%s') AS 'date_last_modified' "
							+ "FROM cs_resume WHERE id = ? and id_user = ?";
					result = conn.executeQuery(psql, id_resume, id_user);
					
					while (result.next()) {
						request.setAttribute("res0", result.getInt("id"));
						request.setAttribute("res1", result.getString("title"));
						request.setAttribute("res2", result.getString("professional_summary"));
						request.setAttribute("res3", result.getString("technical_skills"));
						request.setAttribute("res4", result.getString("professional_experience"));
						request.setAttribute("res5", result.getString("education"));
						request.setAttribute("res6", result.getString("publicc"));
						request.setAttribute("res7", result.getString("date_created"));
						request.setAttribute("res8", result.getString("date_last_modified"));
						request.setAttribute("res9", id_resume);
					}
					
					conn.closeDB();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				
				ServletContext sc = getServletContext();
				RequestDispatcher rd = sc.getRequestDispatcher(url);
				rd.forward(request, response);
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
