package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBconnection {

		public static Connection getConnection() throws Exception
		{

				Class.forName("com.mysql.cj.jdbc.Driver");
				 return DriverManager.getConnection(
            "jdbc:mysql://yamanote.proxy.rlwy.net:56002/railway",
            "root",
            "VAtqkwQKTDRHXIHpfAKISyQRHvwJqyzJ"
        );
		}
}
