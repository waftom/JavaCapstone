package access;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class PreparedConnDBCP{
	private Connection conn = null;

	public PreparedConnDBCP() {
		this.openDB();
	}

	public boolean isAvailable() {
		if (this.conn == null) {
			return false;
		}
		return true;
	}

	public void closeDB() throws SQLException {
		this.conn.close();
	}

	public ResultSet executeQuery(String query, String... aquery) throws SQLException {
		PreparedStatement ps = this.conn.prepareStatement(query);
		for (int i=1,j=0;i<=aquery.length;i++,j++) {
			ps.setString(i, aquery[j]);
		}
		ResultSet rs = ps.executeQuery();
		return rs;
	}


	public int executeUpdate(String query, String... aquery) throws SQLException {
		PreparedStatement ps = this.conn.prepareStatement(query);
		for (int i=1,j=0;i<=aquery.length;i++,j++) {
			ps.setString(i, aquery[j]);
		}
		return ps.executeUpdate();
	}

	public Connection openDB() {
		String myDB = "jdbc:mysql://localhost:3306";
		String user = "root";
		String pswd = "";

		try {
			Class.forName("com.mysql.jdbc.Driver");
			this.conn = DriverManager.getConnection(myDB, user, pswd);
		}
		catch (ClassNotFoundException ex) {
			System.out.println("<br>Can't load JDBC driver");
		}
		catch (SQLException ex) {
			printTrace(ex);
		}

		ConnectionPool pool = ConnectionPool.getInstance();
		this.conn = pool.getConnection();

		return this.conn;
	}

	public void printTrace(SQLException ex) {
		for (Throwable t : ex) {
			t.printStackTrace(System.out);
		}
	}
}
