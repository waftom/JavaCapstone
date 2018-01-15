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
 * Servlet implementation class ServletUpdateProfileSave
 */
@WebServlet("/updateprofilesave")
public class ServletUpdateProfileSave extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletUpdateProfileSave() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		
		String[] sess = (String[]) session.getAttribute("id");
		Integer id_user = Integer.valueOf(sess[0]);
		String fname = new String(request.getParameter("fname"));
		String lname = new String(request.getParameter("lname"));
		String email = new String(request.getParameter("email"));
		String phone = new String(request.getParameter("phone"));
		String address = new String(request.getParameter("address"));
		String oldpwd = new String(request.getParameter("oldpwd"));
		String newpwd = new String(request.getParameter("newpwd"));

		String msg = new String();
		
		try {
			String psql;
			PreparedConnDBCP conn = new PreparedConnDBCP();
			
			int run = 0;

			psql = "USE capstone";
			run = conn.executeUpdate(psql, new String[] {});
			
			if (!newpwd.equals("")) {
				psql = "UPDATE cs_user SET fname = ?, lname = ?, email = ?, phone = ?, address = ?, password = MD5(?) WHERE id = ? and password = MD5(?)";
				run = conn.executeUpdate(psql, fname, lname, email, phone, address, newpwd, new Integer(id_user).toString(), oldpwd);
			} else {
				psql = "UPDATE cs_user SET fname = ?, lname = ?, email = ?, phone = ?, address = ? WHERE id = ? and password = MD5(?)";
				run = conn.executeUpdate(psql, fname, lname, email, phone, address, new Integer(id_user).toString(), oldpwd);
			}
			
			session.invalidate();
			session = null;
						
			msg = "Profile Updated successfully";
			
			conn.closeDB();

			request.setAttribute("msg", msg);
			ServletContext sc = getServletContext();
			RequestDispatcher rd = sc.getRequestDispatcher("/index.jsp");
			rd.forward(request, response);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
