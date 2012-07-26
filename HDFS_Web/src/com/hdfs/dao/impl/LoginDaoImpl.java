package com.hdfs.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.hdfs.dao.LoginDao;
import com.hdfs.pojo.User;
import com.hdfs.util.DBUtil;

public class LoginDaoImpl implements LoginDao{
	public User login(String username, String password) {
		User u = null;
		String sql = "SELECT * FROM user WHERE username=? and password=? ";
		DBUtil util = new DBUtil();
		Connection conn = util.openConnection();
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, username);
			pstmt.setString(2, password);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				u = new User();
				u.setUsername(rs.getString(1));
				u.setPassword(rs.getString(2));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			util.closeConnection(conn);
		}
		return u;
	}
}
