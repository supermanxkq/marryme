package com.marryme.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.marryme.bean.User;
import com.marryme.dao.UserDao;

/**
 * Servlet implementation class RegitServlet
 */
@WebServlet("/RegitServlet")
public class RegitServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RegitServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		request.setCharacterEncoding("UTF-8");

		long regeditToken = Long.parseLong(request.getParameter("regeditToken"));
		long tokenInSession = Long.parseLong(request.getSession().getAttribute("sessionRegeditToken") + "");
		if (regeditToken == tokenInSession) {
			String userName = request.getParameter("userName");
			String passWord = request.getParameter("passWord");
			String phone = request.getParameter("phone");
			String address = request.getParameter("address");
			String name = request.getParameter("name");
			String hobby = request.getParameter("hobby");
			String weChat = request.getParameter("weChat");
			String edu = request.getParameter("edu");
			String sex = request.getParameter("sex");
			String job = request.getParameter("job");
			String age = request.getParameter("age");
			String desc = request.getParameter("desc");
			String validateCode = request.getParameter("validateCode");
			User user = new User();
			user.setUserName(userName);
			user.setPassWord(passWord);
			user.setPhone(phone);
			user.setAddress(address);
			user.setName(name);
			user.setHobby(hobby);
			user.setWeChat(weChat);
			user.setEdu(edu);
			user.setSex(sex);
			user.setJob(job);
			user.setAge(Integer.parseInt(age));
			user.setDesc(desc);
			user.setHeadPic("img_10.jpg");
			UserDao userDao = new UserDao();
			try {
				String sessionValidateCode = (String) request.getSession().getAttribute("radomString");
				if (validateCode.equalsIgnoreCase(sessionValidateCode)) {
					int count = userDao.regeditUser(user);
					if (count > 0) {
						user = userDao.findUserByNameAndPwd(user.getUserName(), user.getPassWord());
						HttpSession session = request.getSession();
						session.setAttribute("user", user);
						request.getRequestDispatcher("index.jsp").forward(request, response);
					}
				} else {
					request.setAttribute("error", "验证码输入错误！！");
					request.getRequestDispatcher("regedit.jsp").forward(request, response);
				}
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			request.getSession().setAttribute("sessionRegeditToken", System.currentTimeMillis());
		} else {
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}
}
