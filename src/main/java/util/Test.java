package util;

import java.sql.Connection;

public class Test {

		public static void main(String[] args) throws Exception {
			
			Connection con = DBconnection.getConnection();
			
			if(con != null)
			{
				System.out.println("connection created");
			} else {
				System.out.println("connection failed");
			}
			
		}
}
