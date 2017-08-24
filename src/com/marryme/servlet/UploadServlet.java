package com.marryme.servlet;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.marryme.bean.User;
import com.marryme.dao.UserDao;

/**
 * Servlet implementation class UploadServlet
 */
@WebServlet("/UploadServlet")
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * Default constructor.
	 */
	public UploadServlet() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		UserDao userDao = new UserDao();
		String headPic = "";
		// 为解析类提供配置信息
		DiskFileItemFactory factory = new DiskFileItemFactory();
		// 创建解析类的实例
		ServletFileUpload sfu = new ServletFileUpload(factory);
		// 开始解析
		sfu.setFileSizeMax(1024 * 400);
		// 每个表单域中数据会封装到一个对应的FileItem对象上
		try {
			List<FileItem> items = sfu.parseRequest(request);
			// 区分表单域
			for (int i = 0; i < items.size(); i++) {
				FileItem item = items.get(i);
				// isFormField为true，表示这不是文件上传表单域
				if (item.isFormField()) {
					String fieldName =item.getFieldName();
					String value = new String(item.getString().getBytes("iso-8859-1"),"utf-8");
					request.setAttribute(fieldName, value);
				} else {
					ServletContext sctx = getServletContext();
					// 获得存放文件的物理路径
					// upload下的某个文件夹 得到当前在线的用户 找到对应的文件夹

					String path = sctx.getRealPath("/upload");
					System.out.println(path);
					// 获得文件名
					String fileName = item.getName();
					headPic = fileName;
					System.out.println(fileName);
					// 该方法在某些平台(操作系统),会返回路径+文件名
					fileName = fileName.substring(fileName.lastIndexOf("/") + 1);
					File file = new File(path + "\\" + fileName);
					if (!file.exists()) {
						item.write(file);
					}
				}

			}
			try {
				User user = userDao.findUserById(Integer.parseInt(request.getAttribute("id").toString()));
				user.setName(request.getAttribute("name").toString());
				user.setAge(Integer.parseInt((String) request.getAttribute("age")));
				user.setAddress(request.getAttribute("address").toString());
				user.setJob(request.getAttribute("job").toString());
				user.setHobby(request.getAttribute("hobby").toString());
				user.setWeChat(request.getAttribute("weChat").toString());
				user.setDesc(request.getAttribute("desc").toString());
				user.setSex(request.getAttribute("sex").toString());
				user.setHeadPic(headPic);
				userDao.updateUser(user);
				HttpSession session = request.getSession();
				User user2 = (User) session.getAttribute("user");
				// 将上传图片的名字记录到数据库中
				request.getRequestDispatcher("/FindInfoServlet?id=" + user2.getId()).forward(request, resp);
			} catch (NumberFormatException | ClassNotFoundException | SQLException e1) {
				e1.printStackTrace();
			}
		} catch (

		Exception e) {
			e.printStackTrace();
		}

	}
}
