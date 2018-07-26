package DB;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBExecutor {
	private Connection conn;
	private Statement stmt;
	
	
	 public DBExecutor(Connection conn) {
		super();
		this.conn = conn;
		try {
            this.stmt = conn.createStatement();
        } catch (SQLException e) {
            e.printStackTrace();
        }
	}

	 public boolean exec(String sql) {
		 try {
			 stmt.executeUpdate(sql);
		 }catch(SQLException e){
			 e.printStackTrace();
			 return false;
         }
		 return true;
	 }
	 
	 public ResultSet execToSet(String sql) {
		 ResultSet rs = null;
		 try {
			 rs = stmt.executeQuery(sql);
		 }catch (SQLException e) { 
			 e.printStackTrace();
			 return null;
		 }
	      return rs;
	 }
	
}
