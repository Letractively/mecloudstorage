package com.hdfs.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.net.URI;
import java.util.ArrayList;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FileStatus;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.IOUtils;

import com.hdfs.pojo.FileObj;

public class HDFSFileUtil {

	private static Configuration conf;
	private static String baseuri = "hdfs://master:9000/user/user/";

	/**
	 * get files status.
	 */
	public ArrayList<FileObj> getList(String dir) throws IOException {
		FileSystem fs = getfs();
		FileStatus[] status = fs.listStatus(new Path(dir));
		ArrayList<FileObj> results = new ArrayList<FileObj>();
		if (status != null) {
			for (int i = 0; i < status.length; i++) {
				results.add(new FileObj(status[i]));
			}
		}
		fs.close();
		return results;
	}

	/**
	 * upload
	 * 
	 */
	public void upload(String dir, BufferedInputStream in, String filename)
			throws IOException {
		FileSystem fs = getfs();
		BufferedOutputStream out = new BufferedOutputStream(fs.create(new Path(
				dir + filename)));
		IOUtils.copyBytes(in, out, 4096, true);
		fs.close();
	}

	/**
	 * stream download
	 * 
	 */
	public InputStream download(String filename) throws IOException {
		FileSystem fs = getfs();
		InputStream in = fs.open(new Path(filename));
		return in;
	}

	/**
	 * delete(URI.create(xxx), xxx can't include the illegal characters.)
	 * 
	 */
	public void delete(String file) throws FileNotFoundException, IOException {
		FileSystem fs = getfs();
		fs.deleteOnExit(new Path(file));
		fs.close();
	}

	/**
	 * rename
	 * 
	 */
	public boolean rename(String src, String dst) throws IOException {
		FileSystem fs = getfs();
		return fs.rename(new Path(src), new Path(dst));
	}

	/**
	 * mkdirs
	 * 
	 */
	public boolean mkdirs(String path) throws IOException {
		FileSystem fs = getfs();
		return fs.mkdirs(new Path(path));
	}

	/**
	 * get baseuri.
	 * 
	 */
	public static String getBaseuri() {
		return baseuri;
	}

	/**
	 * get configuration.
	 * 
	 */
	private static FileSystem getfs() {
		if (conf == null) {
			conf = new Configuration();
		}
		FileSystem fs = null;
		try {
			fs = FileSystem.get(URI.create(baseuri), conf);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return fs;
	}
}
