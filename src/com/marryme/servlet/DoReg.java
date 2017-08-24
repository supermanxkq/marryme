package com.marryme.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.marryme.bean.User;
import com.marryme.dao.UserDao;

/**
 * Servlet implementation class DoReg
 */
@WebServlet("/DoReg")
public class DoReg extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String uname = request.getParameter("userName");
		uname = new String(uname.getBytes("ISO-8859-1"),"UTF-8");
		PrintWriter out = response.getWriter();
		boolean UExsixt = false;
		UserDao userDao = new UserDao();
		try {
			List<User> users = userDao.findUsers();
			int i = 1;
			for (User user : users) {
				String userName = user.getUserName();
				if (userName.equals(uname)) {
					UExsixt = true;
					out.print(UExsixt);
					break;
				} else {
					if (i == users.size()) {
						out.print(UExsixt);
					}
				}
				i++;
			}

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}
