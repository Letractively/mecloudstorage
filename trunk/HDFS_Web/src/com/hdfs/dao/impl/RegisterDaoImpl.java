package com.hdfs.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.hdfs.dao.RegisterDao;
import com.hdfs.util.DBUtil;

public class RegisterDaoImpl implements RegisterDao {
	public boolean register(String username, String password) {
		String sql = "INSERT INTO user (username, password) VALUES(?, ?)";
		DBUtil util = new DBUtil();
		Connection conn = util.openConnection();
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, username);
			pstmt.setString(2, password);
			if (pstmt.executeUpdate() > 0) {
				return true;
			} else {
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			util.closeConnection(conn);
		}
		return false;
	}
}
