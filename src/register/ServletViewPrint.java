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
 * Servlet implementation class ServletViewPrint
 */
@WebServlet("/viewprint")
public class ServletViewPrint extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletViewPrint() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = new String("/print.jsp");
		String id = new String();
		if (request.getParameter("id") != null) {
			id = new String(request.getParameter("id"));
				
			try {
				String psql = new String();
				ResultSet result = null;
				PreparedConnDBCP conn = new PreparedConnDBCP();
				int run = 0;
				
				psql = "USE capstone";
				run = conn.executeUpdate(psql, new String[] {});
				
				psql = "SELECT 	us.fname, us.lname, us.email, us.phone, us.address, re.professional_summary, "
						+ "re.technical_skills, re.professional_experience, re.education "
						+ "FROM cs_resume AS re, cs_user AS us "
						+ "WHERE re.id = ? AND re.id_user = us.id AND re.publicc = 1";
				result = conn.executeQuery(psql, id);
				
				while (result.next()) {
					request.setAttribute("fname", result.getString("fname"));
					request.setAttribute("lname", result.getString("lname"));
					request.setAttribute("email", result.getString("email"));
					request.setAttribute("phone", result.getString("phone"));
					request.setAttribute("address", result.getString("address"));
					request.setAttribute("professional_summary", result.getString("professional_summary"));
					request.setAttribute("technical_skills", result.getString("technical_skills"));
					request.setAttribute("professional_experience", result.getString("professional_experience"));
					request.setAttribute("education", result.getString("education"));
				}
				
				conn.closeDB();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else {
			HttpSession session = request.getSession(false);
			String[] sess = (String[]) session.getAttribute("id");
			
			request.setAttribute("fname", sess[1]);
			request.setAttribute("lname", sess[2]);
			request.setAttribute("email", sess[3]);
			request.setAttribute("phone", sess[4]);
			request.setAttribute("address", sess[5]);
			request.setAttribute("professional_summary", request.getParameter("professional_summary"));
			request.setAttribute("technical_skills", request.getParameter("technical_skills"));
			request.setAttribute("professional_experience", request.getParameter("professional_experience"));
			request.setAttribute("education", request.getParameter("education"));
		}
		
		ServletContext sc = getServletContext();
		RequestDispatcher rd = sc.getRequestDispatcher(url);
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
