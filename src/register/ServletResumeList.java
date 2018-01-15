package register;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
 * Servlet implementation class ServletResumeList
 */
@WebServlet("/resumelist")
public class ServletResumeList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ServletResumeList() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//HttpSession session = request.getSession(false);
		
		if (request.getSession(false) == null) {
			request.setAttribute("msg", "Lost Session!");
			ServletContext sc = getServletContext();
			RequestDispatcher rd = sc.getRequestDispatcher("/index.jsp");
			rd.forward(request, response);
		} else {
			HttpSession session = request.getSession(false);
			String[] sess = (String[]) session.getAttribute("id");
			String id_user = sess[0];
			
			PreparedConnDBCP conn = new PreparedConnDBCP();
	
			List<ResumeList> list = new ArrayList<>();
			List<ResumePublic> publik = new ArrayList<>();
			String psql;
			ResultSet result = null;
			String url = "/resume_list.jsp";
	
			try {
				int run = 0;
	
				psql = "USE capstone";
				run = conn.executeUpdate(psql, new String[] {});
	
				psql = "SELECT id, title, publicc, DATE_FORMAT(date_created, '%m/%d/%Y %H:%m:%s') AS 'date_created', "
						+ "DATE_FORMAT(date_created, '%Y/%m/%d %H:%m:%s') AS 'c_date_created', "
						+ "DATE_FORMAT(date_last_modified, '%m/%d/%Y %H:%m:%s') AS 'date_last_modified', "
						+ "DATE_FORMAT(date_last_modified, '%Y/%m/%d %H:%m:%s') AS 'c_date_last_modified' "
						+ "FROM cs_resume WHERE id_user = ?";
				result = conn.executeQuery(psql, id_user);
	
				UserResumeList userList = new UserResumeList(result);	
				list = userList.getUrlist();
				
				psql = "SELECT re.id, us.fname, us.lname, re.title, DATE_FORMAT(re.date_created, '%m/%d/%Y %H:%m:%s') AS 'date_created', "
						+ "DATE_FORMAT(re.date_created, '%Y/%m/%d %H:%m:%s') AS 'c_date_created', "
						+ "DATE_FORMAT(re.date_last_modified, '%m/%d/%Y %H:%m:%s') AS 'date_last_modified', "
						+ "DATE_FORMAT(re.date_last_modified, '%Y/%m/%d %H:%m:%s') AS 'c_date_last_modified' "
						+ "FROM cs_resume AS re, cs_user AS us WHERE re.id_user != ? AND re.id_user = us.id AND re.publicc = 1";
				result = conn.executeQuery(psql, id_user);
	
				UserResumePublic publikList = new UserResumePublic(result);	
				publik = publikList.getUrpublic();
				
				conn.closeDB();
	
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			request.setAttribute("list", list);
			request.setAttribute("publik", publik);
			ServletContext sc = getServletContext();
			RequestDispatcher rd = sc.getRequestDispatcher(url);
			rd.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
