package com.hdfs.dao;

import java.util.ArrayList;

import com.hdfs.pojo.Log;

public interface LogDao {
	public ArrayList<Log> read(String username);

	public boolean write(String username, String action, String filename,
			String pathname);
}
