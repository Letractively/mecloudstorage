package com.hdfs.servlet;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hdfs.util.HDFSFileUtil;

@WebServlet("/ViewServlet")
public class ViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String baseuri = HDFSFileUtil.getBaseuri();

	public ViewServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");
		String file = request.getParameter("file");
		String dir = request.getParameter("dir");
		String filename = new String(file.getBytes("iso-8859-1"), "GB18030");
		String homedir = baseuri + username + "/" + filename;
		if (dir != null) {
			homedir = baseuri + username + "/" + dir + "/" + filename;
		}
		response.setContentType("image/jpeg");
		OutputStream out = null;
		InputStream in = null;
		try {
			out = response.getOutputStream();
			HDFSFileUtil hUtil = new HDFSFileUtil();
			in = hUtil.download(homedir);
			byte[] ioBuffer = new byte[4096];
			int readLen = 0;
			while ((readLen = in.read(ioBuffer)) != -1) {
				out.write(ioBuffer, 0, readLen);
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			out.close();
			in.close();
		}
	}

}
