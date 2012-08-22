package com.hdfs.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.hdfs.dao.PictureDao;
import com.hdfs.util.DBUtil;

public class PictureDaoImpl implements PictureDao {
	public boolean insert(String username, String pathname) {
		String sql = "INSERT INTO picture (username, pathname) VALUES(?, ?)";
		DBUtil util = new DBUtil();
		Connection conn = util.openConnection();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, username);
			pstmt.setString(2, pathname);
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

	public ArrayList<String> get(String username) {
		ArrayList<String> paths = new ArrayList<String>();
		String sql = "SELECT pathname FROM picture WHERE username=?";
		DBUtil util = new DBUtil();
		Connection conn = util.openConnection();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, username);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				String s = rs.getString(1);
				paths.add(s);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			util.closeConnection(conn);
		}
		return paths;
	}

	public boolean delete(String pathname) {
		String sql = "DELETE FROM picture WHERE pathname=?";
		DBUtil util = new DBUtil();
		Connection conn = util.openConnection();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pathname);
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
