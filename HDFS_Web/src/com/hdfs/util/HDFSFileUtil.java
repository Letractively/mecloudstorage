package com.hdfs.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URI;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.util.Streams;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FSDataInputStream;
import org.apache.hadoop.fs.FileStatus;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;

import com.hdfs.pojo.FileObj;

public class HDFSFileUtil {

	private static Configuration conf;
	private static String baseuri = "hdfs://10.120.220.94:9000/user/user/";

	/**
	 * 获取文件状态列表
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
	 * 上传文件.(还需要进行修改)
	 * 
	 */
	public void upload(String homedir, HttpServletRequest request)
			throws IOException {
		conf = getConfiguration();
		FileSystem fs = FileSystem.get(URI.create(homedir), conf);
		if (ServletFileUpload.isMultipartContent(request)) {
			try {
				ServletFileUpload upload = new ServletFileUpload();
				FileItemIterator iter = upload.getItemIterator(request);
				while (iter.hasNext()) {
					FileItemStream item = iter.next();
					if (!item.isFormField() && item.getName().length() > 0) {
						String fileName = item.getName();
						BufferedInputStream in = new BufferedInputStream(
								item.openStream());
						BufferedOutputStream out = new BufferedOutputStream(
								fs.create(new Path(homedir + fileName)));
						Streams.copy(in, out, true);
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public void download(String username, String file)
			throws FileNotFoundException, IOException {
		conf = getConfiguration();
		String remote = baseuri + username + "/" + file;
		String local = "D:\\hdfs\\" + file;

		FileSystem fs = FileSystem.get(URI.create(baseuri), conf);
		FSDataInputStream hdfsInStream = fs.open(new Path(remote));
		File fi = new File(local);
		if (fi.exists()) {
			if (fi.isDirectory()) {
				;
			} else {
				fi.createNewFile();
			}
		} else {
			File fil = new File(fi.getParent());
			fil.mkdirs();
			if (fi.isDirectory()) {
				;
			} else {
				fi.createNewFile();
			}
		}
		OutputStream out = new FileOutputStream(fi);
		byte[] ioBuffer = new byte[4096];
		int readLen = 0;
		while ((readLen = hdfsInStream.read(ioBuffer)) != -1) {
			out.write(ioBuffer, 0, readLen);
		}
		out.close();
		hdfsInStream.close();
		fs.close();
	}

	/**
	 * 删除一个文件或目录
	 * 
	 */
	public void delete(String file) throws FileNotFoundException, IOException {
		conf = getConfiguration();
		FileSystem fs = FileSystem.get(URI.create(file), conf);
		fs.deleteOnExit(new Path(file));
		fs.close();
	}

	/**
	 * 获取根目录
	 * 
	 */
	public static String getBaseuri() {
		return baseuri;
	}

	private static Configuration getConfiguration() {
		if (conf == null) {
			conf = new Configuration();
		}
		return conf;
	}
}
