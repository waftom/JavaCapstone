package access;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.DatabaseMetaData;

import register.ResumeList;
import register.User;


/**
 * Servlet implementation class ServletLogin
 */
@WebServlet("/home")
public class ServletLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ServletLogin() {
		super();

	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String msg = new String();
		String url = new String();
		String psql = new String();
		ResultSet result = null;
		PreparedConnDBCP conn = new PreparedConnDBCP();
		int[] num = new int[2];
		num[0] = 0;
		num[1] = 0;
		int run = 0;

	//	HttpSession session = request.getSession(false);
		
		if (request.getParameter("login") != null && request.getParameter("pwd") != null) {			
			String login = new String(request.getParameter("login"));
			String pwd = new String(request.getParameter("pwd"));
							HttpSession session = request.getSession();
				
			try {
				psql = "USE capstone";
				run = conn.executeUpdate(psql, new String[] {});
				
				psql = "SHOW TABLES LIKE ?";
				result = conn.executeQuery(psql, "cs_user");
				
				if (!result.first()) {
					msg = "Create the first user!";
					url = "/index.jsp";
				} else {
					psql = "SELECT id, fname, lname, email, phone, address, login, DATE_FORMAT(date_last_login, '%m/%d/%Y at %H:%m:%s') AS 'date_last_login' FROM cs_user WHERE login = ? and password = MD5(?)";
					result = conn.executeQuery(psql, login,pwd);
		
					if (result.first()) {
						psql = "UPDATE cs_user SET date_last_login = NOW() where login = ? and password = MD5(?)";
						run = conn.executeUpdate(psql, login,pwd);
		
						String[] sess = new String[8];
						sess[0] = result.getString("id");
						sess[1] = result.getString("fname");
						sess[2] = result.getString("lname");
						sess[3] = result.getString("email");
						sess[4] = result.getString("phone");
						sess[5] = result.getString("address");
						sess[6] = result.getString("login");
						sess[7] = result.getString("date_last_login");
		
						session.setAttribute("id", sess);
						session.setMaxInactiveInterval(60 * 30);
		
						num = numberResumes(request);
						url = "/restricted.jsp";
					} else {
						msg = "User not found!";
						url = "/index.jsp";
					}
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else {
			if (request.getSession(false) != null) {
				num = numberResumes(request);
				url = "/restricted.jsp";
			} else {
				msg = "Login first!";
				url = "/index.jsp";
			}
		}
		
		request.setAttribute("my_res", num[0]);
		request.setAttribute("pb_res", num[1]);
		
		request.setAttribute("msg", msg);
		ServletContext sc = getServletContext();
		RequestDispatcher rd = sc.getRequestDispatcher(url);
		rd.forward(request, response);
	}
	
	protected int[] numberResumes(HttpServletRequest request){
		int[] num = new int[2];
		String psql;
		int run = 0;
		try {			
			ResultSet result = null;
			PreparedConnDBCP conn = new PreparedConnDBCP();
			
			psql = "USE capstone";
			run = conn.executeUpdate(psql, new String[] {});
			
			//HttpSession s = request.getSession(false);
			String[] sess = (String[]) request.getSession(false).getAttribute("id");
			String id_user = sess[0];
			
			psql = "SELECT COUNT(id) as 'num' FROM cs_resume WHERE id_user = ?";
			result = conn.executeQuery(psql, id_user);
			
			while (result.next()) {
				num[0] = result.getInt("num");
			}
			
			psql = "SELECT COUNT(id) as 'num' FROM cs_resume";
			result = conn.executeQuery(psql);
			
			while (result.next()) {
				num[1] = result.getInt("num");
			}
			
			conn.closeDB();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return num;
	}
}
