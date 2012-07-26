package com.hdfs.dao;

import com.hdfs.pojo.User;

public interface LoginDao {
	public User login(String username, String password);
}
