package com.hdfs.pojo;
import org.apache.hadoop.fs.FileStatus;

/**
 * 用于文件系统操作的对象，根据HDFS那个表制作。
 *  @author 李志闯
 */
public class FileObj {
	public FileObj(FileStatus fs) {
		name = fs.getPath().getName();
		type = fs.isDir();
		size = fs.getLen();
		replication = fs.getReplication();
		block_size = fs.getBlockSize();
		mtime = fs.getModificationTime();
		permission = fs.getPermission().toString();
		owner = fs.getOwner();
		group = fs.getGroup();
	}

	private String name;
	private boolean type;
	private long size;
	private short replication;
	private long block_size;
	private long mtime;
	private String permission;
	private String owner;
	private String group;

	public String getName() {
		return name;
	}
	
	public boolean isType() {
		return type;
	}
	
	public long getSize() {
		return size;
	}

	public short getReplication() {
		return replication;
	}

	public long getBlock_size() {
		return block_size;
	}
	
	public long getMtime() {
		return mtime;
	}

	public String getPermission() {
		return permission;
	}

	public String getOwner() {
		return owner;
	}

	public String getGroup() {
		return group;
	}


}
