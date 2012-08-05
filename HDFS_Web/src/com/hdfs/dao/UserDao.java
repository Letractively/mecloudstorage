package com.hdfs.dao;

import com.hdfs.pojo.User;

public interface UserDao {
	public User login(String username, String password);
	public boolean register(String username, String password);
	public User getinfo(String username);
}
