package com.hdfs.dao;

import java.util.ArrayList;

public interface PictureDao {
	public boolean insert(String username, String pathname);

	public ArrayList<String> get(String username);

	public boolean delete(String pathname);
}
