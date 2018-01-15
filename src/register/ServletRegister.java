package register;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import access.DBUtil;
import access.PreparedConnDBCP;

/**
 * Servlet implementation class ServletRegister
 */
@WebServlet("/register")
public class ServletRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ServletRegister() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	public String MD5(String md5) {
		try {
			java.security.MessageDigest md = java.security.MessageDigest.getInstance("MD5");
			byte[] array = md.digest(md5.getBytes());
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < array.length; ++i) {
				sb.append(Integer.toHexString((array[i] & 0xFF) | 0x100).substring(1, 3));
			}
			return sb.toString();
		} catch (java.security.NoSuchAlgorithmException e) {
		}
		return null;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String fname = new String(request.getParameter("fname"));
		String lname = new String(request.getParameter("lname"));
		String email = new String(request.getParameter("email"));
		String phone = new String(request.getParameter("phone"));
		String address = new String(request.getParameter("address"));
		String login = new String(request.getParameter("loginr"));
		String pwd = new String(request.getParameter("pwdr"));

		String msg = new String();

		String url = "/index.jsp";

		try {
			String psql;
			ResultSet result = null;

			PreparedConnDBCP conn = new PreparedConnDBCP();
			
			int run = 0;

			psql = "USE capstone";
			run = conn.executeUpdate(psql, new String[] {});

			psql = "SHOW TABLES LIKE ?";
			result = conn.executeQuery(psql, "cs_user");

			if (!result.first()) {
				EntityManager em = DBUtil.getEmFactory().createEntityManager();

				Date date = new Date();
				Timestamp datetime = new Timestamp(date.getTime());

				User user = new User();
				user.setFname(fname);
				user.setLname(lname);
				user.setEmail(email);
				user.setPhone(phone);
				user.setAddress(address);
				user.setLogin(login);
				user.setPassword(MD5(pwd));
				user.setDate_created(datetime);
				user.setDate_last_login(null);

				EntityTransaction trans = em.getTransaction();
				try {
					trans.begin();
					em.persist(user);
					trans.commit();
				} catch (Exception ex) {
					System.out.println(ex);
					trans.rollback();
				} finally {
					em.close();
				}

				msg = "Registered successfully";
			} else {
				psql = "SELECT fname FROM cs_user WHERE login = ?";
				result = conn.executeQuery(psql, login);

				if (result.first()) {
					msg = "Login already exists!";
				} else {
					psql = "INSERT INTO cs_user (fname, lname, email, phone, address, login, password, date_created)"
							+ "VALUES (?, ?, ?, ?, ?, ?, MD5(?), NOW());";
					run = conn.executeUpdate(psql, fname, lname, email, phone, address, login, pwd);

					msg = "Registered successfully";
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
