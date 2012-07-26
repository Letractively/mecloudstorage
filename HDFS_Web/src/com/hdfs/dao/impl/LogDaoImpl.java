package com.hdfs.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import com.hdfs.dao.LogDao;
import com.hdfs.pojo.Log;
import com.hdfs.util.DBUtil;

public class LogDaoImpl implements LogDao {
	ArrayList<Log> logList = new ArrayList<Log>();

	public ArrayList<Log> read(String username) {
		String sql = "SELECT username, optime, action, filename, pathname FROM log WHERE username = ?";
		DBUtil util = new DBUtil();
		Connection conn = util.openConnection();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, username);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				Log log = new Log();
				log.setUsername(rs.getString(1));
				log.setDate(rs.getString(2).substring(0, 19));
				log.setAction(rs.getString(3));
				log.setFilename(rs.getString(4));
				log.setPathname(rs.getString(5));
				logList.add(log);
			}
			return logList;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			util.closeConnection(conn);
		}
		return null;
	}

	public boolean write(String username, String action, String filename,
			String pathname) {
		String sql = "INSERT INTO log (username, optime, action, filename, pathname) VALUES(?, ?, ?, ?, ?)";
		DBUtil util = new DBUtil();
		Connection conn = util.openConnection();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, username);
			String optime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
					.format(new Date());
			pstmt.setString(2, optime);
			pstmt.setString(3, action);
			pstmt.setString(4, filename);
			pstmt.setString(5, pathname);
			if (pstmt.executeUpdate() > 0)
				return true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			util.closeConnection(conn);
		}
		return false;
	}

}
