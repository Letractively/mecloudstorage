package com.hdfs.pojo;

/**
 * 该类用于保存从MySQL数据库中取出来的用户信息。
 * 
 * @author 李志闯
 * 
 */
public class User {
	private String username;
	private String password;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}
