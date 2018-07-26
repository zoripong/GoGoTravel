package DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;



public class DBConnector {
	public static Connection getMySqlConnection() {
		 Connection conn = null;
			System.out.println("왜??mm");
			try {
					
				Class.forName("com.mysql.jdbc.Driver");

				String url = "jdbc:mysql://119.205.221.104:3306/GoGoTravel?characterEncoding=UTF-8&serverTimezone=UTC";
				String user = "ggt2";
				String password = "Aggt2018@)!*";
				System.out.println("야호2"+user+"/"+password);
				
				conn = DriverManager.getConnection(url, user, password);
				System.out.println(conn);
			}catch(ClassNotFoundException | SQLException e) {
				e.printStackTrace();
				System.out.println(e.toString());
			}	
		 
		
		
		return conn;
	}
	

}
