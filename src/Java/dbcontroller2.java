package Java;

import java.sql.*;

public class dbcontroller2 {
	String dbHost = "localhost";
	String dbDataBase = "pos";
	String dbID = "root";
	String dbPW = "autoset";
	
	Connection dbcon = null;
	Statement dbstmt = null;
	
	public dbcontroller2() {
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			dbcon = DriverManager.getConnection(
					"jdbc:mysql://" + dbHost + "/" + dbDataBase, dbID, dbPW);
			dbstmt = dbcon.createStatement();
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
			System.exit(-1);
		}
	}
	
	public String[][] sqlQuery(String sQuery) {
		String[][] sResult = null;
		try {
			if(sQuery.indexOf("INSERT INTO") != -1 || sQuery.indexOf("UPDATE") != -1 ||
					sQuery.indexOf("DELETE") != -1) {
				dbstmt.executeUpdate(sQuery);
				return null;
			}
			ResultSet oResultSet = dbstmt.executeQuery(sQuery);
			System.out.println(sQuery);
			int iCountColumns = oResultSet.getMetaData().getColumnCount();
			sResult = new String[1000][iCountColumns + 50];
			while(oResultSet.next()) {
				for(int i = 1; i <= iCountColumns; i++) {
					System.out.println("sResult[" + (oResultSet.getRow() - 1) + "][" + (i - 1) + "] = " + oResultSet.getString(i) + " 대입");
					sResult[oResultSet.getRow() - 1][i - 1] = oResultSet.getString(i);
				}
			}
			System.out.println(" : " + sResult[0][0]);
			System.out.println("sResult 대입완료");
		} catch (Exception e) {
			e.printStackTrace();
		}
			return sResult;
	}
}
