package com.marryme.dao;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * jdbc
 * 
 * @author Administrator
 * 
 */
public class MysqlConn {

	public static Connection getConn() throws ClassNotFoundException,
			SQLException {
		Class.forName("org.gjt.mm.mysql.Driver");
		Connection conn = DriverManager
				.getConnection(
						"jdbc:mysql://localhost:3306/marry?useUnicode=true&characterEncoding=UTF-8",
						"root", "root");
		return conn;

	}
}
