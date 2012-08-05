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
	public ArrayList<FileObj> getList(String home) throws IOException {
		FileSystem fs = FileSystem.get(URI.create(home), new Configuration());
		FileStatus[] status = fs.listStatus(new Path(home));
		ArrayList<FileObj> results = new ArrayList<FileObj>();
		if (status != null) {
			for (int i = 0; i < status.length; i++) {
				results.add(new FileObj(status[i]));
			}
		}
		return results;
	}

	/**
	 * upload
	 * 
	 */
	public void upload(String homedir, BufferedInputStream in, String fileName)
			throws IOException {
		conf = getConfiguration();
		FileSystem fs = FileSystem.get(URI.create(homedir), conf);
		BufferedOutputStream out = new BufferedOutputStream(fs.create(new Path(
				homedir + fileName)));
		IOUtils.copyBytes(in, out, 4096, true);
	}

	/**
	 * stream download
	 * 
	 */
	public InputStream download(String homedir)
			throws IOException {
		conf = getConfiguration();
		FileSystem fs = FileSystem.get(URI.create(baseuri), conf);
		InputStream in = fs.open(new Path(homedir));
		return in;
	}

	/**
	 * delete(URI.create(xxx), xxx can't include the illegal characters.)
	 * 
	 */
	public void delete(String file) throws FileNotFoundException, IOException {
		conf = getConfiguration();
		FileSystem fs = FileSystem.get(URI.create(baseuri), conf);// URI.create(xxx)
		fs.deleteOnExit(new Path(file));
		fs.close();
	}

	public boolean rename(String src, String dst) throws IOException {
		conf = getConfiguration();
		FileSystem fs = FileSystem.get(URI.create(baseuri), conf);
		return fs.rename(new Path(src), new Path(dst));
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
	private static Configuration getConfiguration() {
		if (conf == null) {
			conf = new Configuration();
		}
		return conf;
	}
}
