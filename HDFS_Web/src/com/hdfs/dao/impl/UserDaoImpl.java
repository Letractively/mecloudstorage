package com.hdfs.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.hdfs.dao.UserDao;
import com.hdfs.pojo.User;
import com.hdfs.util.DBUtil;

public class UserDaoImpl implements UserDao {
	public User login(String username, String password) {
		User u = null;
		String sql = "SELECT * FROM user WHERE username=? and password=? ";
		DBUtil util = new DBUtil();
		Connection conn = util.openConnection();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
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

	public boolean register(String username, String password) {
		String sql = "INSERT INTO user (username, password) VALUES(?, ?)";
		DBUtil util = new DBUtil();
		Connection conn = util.openConnection();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
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
	public User getinfo(String username) {
		User u = null;
		String sql = "SELECT * FROM user WHERE username=?";
		DBUtil util = new DBUtil();
		Connection conn = util.openConnection();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, username);
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
