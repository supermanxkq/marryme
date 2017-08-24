package com.marryme.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.marryme.bean.User;

public class UserDao {

	Connection connection;

	public int regeditUser(User user) throws ClassNotFoundException, SQLException {
		connection = MysqlConn.getConn();
		String sql = "insert into user(userName,passWord,sex,age,hobby,address,headPic,desca,job,edu,phone,weChat,name)values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement prep = connection.prepareStatement(sql);
		prep.setObject(1, user.getUserName());
		prep.setObject(2, user.getPassWord());
		prep.setObject(3, user.getSex());
		prep.setObject(4, user.getAge());
		prep.setObject(5, user.getHobby());
		prep.setObject(6, user.getAddress());
		prep.setObject(7, user.getHeadPic());
		prep.setObject(8, user.getDesc());
		prep.setObject(9, user.getJob());
		prep.setObject(10, user.getEdu());
		prep.setObject(11, user.getPhone());
		prep.setObject(12, user.getWeChat());
		prep.setObject(13, user.getName());
		int count = prep.executeUpdate();
		// 关闭流
		prep.close();
		connection.close();
		return count;
	}

	public User login(String userName, String passWord) throws SQLException, ClassNotFoundException {
		connection = MysqlConn.getConn();
		User user = null;
		String sql = "select * from user where userName=? and passWord=?";
		PreparedStatement prep = connection.prepareStatement(sql);
		prep.setObject(1, userName);
		prep.setObject(2, passWord);
		ResultSet rs = prep.executeQuery();
		String phoneDB = "";
		String addressDB = "";
		if (rs.next()) {
			int idDB = Integer.parseInt(rs.getObject("id").toString());
			String userNameDB = rs.getObject("userName").toString();
			String passWordDB = rs.getObject("passWord").toString();
			if (rs.getObject("phone") != null && rs.getObject("address") != null) {
				phoneDB = rs.getObject("phone").toString();
				addressDB = rs.getObject("address").toString();
			}
			user = new User();
			user.setUserName(userNameDB);
			user.setPassWord(passWordDB);
			user.setPhone(phoneDB);
			user.setAddress(addressDB);
			user.setId(idDB);
		}
		prep.close();
		connection.close();
		return user;
	}

	public User findUserById(int id) throws SQLException, ClassNotFoundException {
		connection = MysqlConn.getConn();
		User user = null;
		String sql = "select * from user where id=?";
		PreparedStatement prep = connection.prepareStatement(sql);
		prep.setObject(1, id);
		ResultSet rs = prep.executeQuery();
		if (rs.next()) {
			int idDB = Integer.parseInt(rs.getObject("id").toString());
			String userNameDB = rs.getObject("userName").toString();
			String passWordDB = rs.getObject("passWord").toString();
			String hobby = rs.getObject("hobby").toString();
			String desc = rs.getObject("desca").toString();
			String age = rs.getObject("age").toString();
			String weChat = rs.getObject("weChat").toString();
			String job = rs.getObject("job").toString();
			String name = rs.getObject("name").toString();
			String sex = rs.getObject("sex").toString();
			String headPic = rs.getObject("headPic").toString();
			String phoneDB = "";
			String addressDB = "";
			if (rs.getObject("phone") != null && rs.getObject("address") != null) {
				phoneDB = rs.getObject("phone").toString();
				addressDB = rs.getObject("address").toString();
				user = new User();
				user.setUserName(userNameDB);
				user.setPassWord(passWordDB);
				user.setPhone(phoneDB);
				user.setAddress(addressDB);
				user.setName(name);
				user.setHobby(hobby);
				user.setWeChat(weChat);
				user.setSex(sex);
				user.setJob(job);
				user.setAge(Integer.parseInt(age));
				user.setDesc(desc);
				user.setHeadPic(headPic);
				user.setId(idDB);
			} else {
				user = new User();
				user.setUserName(userNameDB);
				user.setPassWord(passWordDB);
				user.setPhone(phoneDB);
				user.setAddress(addressDB);
				user.setName(name);
				user.setHobby(hobby);
				user.setWeChat(weChat);
				user.setSex(sex);
				user.setJob(job);
				user.setAge(Integer.parseInt(age));
				user.setDesc(desc);
				user.setHeadPic(headPic);
				user.setId(idDB);
			}
		}
		prep.close();
		connection.close();
		return user;
	}

	public int updateUser(User user) throws ClassNotFoundException, SQLException {
		int count = 0;
		connection = MysqlConn.getConn();
		String sql = "update user set sex=?,age=?,hobby=?,address=?,phone=?,headPic=?,desca=?,job=?,edu=?,weChat=?,name=? where id=?";
		PreparedStatement prep = connection.prepareStatement(sql);
		prep.setObject(1, user.getSex());
		prep.setObject(2, user.getAge());
		prep.setObject(3, user.getHobby());
		prep.setObject(4, user.getAddress());
		prep.setObject(5, user.getPhone());
		prep.setObject(6, user.getHeadPic());
		prep.setObject(7, user.getDesc());
		prep.setObject(8, user.getJob());
		prep.setObject(9, user.getEdu());
		prep.setObject(10, user.getWeChat());
		prep.setObject(11, user.getName());
		prep.setObject(12, user.getId());
		count = prep.executeUpdate();
		prep.close();
		connection.close();
		return count;
	}

	/**
	 * 根据用户名和密码查询用户的信息
	 * 
	 * @param user
	 * @return
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	public User findUserByNameAndPwd(String userName, String passWord) throws SQLException, ClassNotFoundException {
		connection = MysqlConn.getConn();
		User user = null;
		String sql = "select * from user where userName=? and passWord=?";
		PreparedStatement prep = connection.prepareStatement(sql);
		prep.setObject(1, userName);
		prep.setObject(2, passWord);
		ResultSet rs = prep.executeQuery();
		if (rs.next()) {
			int idDB = Integer.parseInt(rs.getObject("id").toString());
			String userNameDB = rs.getObject("userName").toString();
			String passWordDB = rs.getObject("passWord").toString();
			String phoneDB = "";
			String addressDB = "";
			if (rs.getObject("phone") != null && rs.getObject("address") != null) {
				phoneDB = rs.getObject("phone").toString();
				addressDB = rs.getObject("address").toString();
				user = new User();
				user.setUserName(userNameDB);
				user.setPassWord(passWordDB);
				user.setPhone(phoneDB);
				user.setAddress(addressDB);
				user.setId(idDB);
			} else {
				user = new User();
				user.setUserName(userNameDB);
				user.setPassWord(passWordDB);
				user.setPhone(phoneDB);
				user.setAddress(addressDB);
				user.setId(idDB);
			}
		}
		prep.close();
		connection.close();
		return user;
	}

	/**
	 * 根据用户名和密码查询用户的信息
	 * 
	 * @param user
	 * @return
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	public List<User> findUserByName(String userName) throws SQLException, ClassNotFoundException {
		connection = MysqlConn.getConn();
		List<User> users = new ArrayList<>();
		User user = null;
		String sql = "select * from user where name like ? ";
		PreparedStatement prep = connection.prepareStatement(sql);
		prep.setObject(1, '%' + userName + '%');
		ResultSet rs = prep.executeQuery();
		if (rs.next()) {
			int idDB = Integer.parseInt(rs.getObject("id").toString());
			String userNameDB = rs.getObject("userName").toString();
			String passWordDB = rs.getObject("passWord").toString();
			String headPic = rs.getObject("headPic").toString();
			String name = rs.getObject("name").toString();
			String desc = rs.getObject("desca").toString();
			String phoneDB = "";
			String addressDB = "";
			if (rs.getObject("phone") != null && rs.getObject("address") != null) {
				phoneDB = rs.getObject("phone").toString();
				addressDB = rs.getObject("address").toString();
				user = new User();
				user.setUserName(userNameDB);
				user.setPassWord(passWordDB);
				user.setPhone(phoneDB);
				user.setName(name);
				user.setDesc(desc);
				user.setHeadPic(headPic);
				user.setAddress(addressDB);
				user.setId(idDB);
				users.add(user);
			} else {
				user = new User();
				user.setUserName(userNameDB);
				user.setPassWord(passWordDB);
				user.setPhone(phoneDB);
				user.setName(name);
				user.setDesc(desc);
				user.setAddress(addressDB);
				user.setHeadPic(headPic);
				user.setId(idDB);
				users.add(user);
			}
		}
		prep.close();
		connection.close();
		return users;
	}

	public List<User> findUsers(int uId) throws ClassNotFoundException, SQLException {
		connection = MysqlConn.getConn();
		List<User> users = new ArrayList<User>();
		User user = null;
		String sql = "SELECT * from user where id not in(select relateId from ralation where userId="+uId+" and type=1) ";
		PreparedStatement prep = connection.prepareStatement(sql);
		ResultSet rs = prep.executeQuery();
		while (rs.next()) {
			String userNameDB = rs.getObject("userName").toString();
			String name = rs.getObject("name").toString();
			String desc = rs.getObject("desca").toString();
			String headPic = rs.getObject("headPic").toString();
			int id = Integer.parseInt(rs.getObject("id").toString());
			user = new User();
			user.setId(id);
			user.setHeadPic(headPic);
			user.setDesc(desc);
			user.setName(name);
			user.setUserName(userNameDB);
			users.add(user);
		}
		if (users != null) {
			for (User user2 : users) {
				if (user2.getId() == uId) {
					users.remove(user2);
					break;
				}
			}
		}
		return users;
	}
	public List<User> findUsers() throws ClassNotFoundException, SQLException {
		connection = MysqlConn.getConn();
		List<User> users = new ArrayList<User>();
		User user = null;
		String sql = "SELECT * from user ";
		PreparedStatement prep = connection.prepareStatement(sql);
		ResultSet rs = prep.executeQuery();
		while (rs.next()) {
			String userNameDB = rs.getObject("userName").toString();
			String name = rs.getObject("name").toString();
			String desc = rs.getObject("desca").toString();
			String headPic = rs.getObject("headPic").toString();
			int id = Integer.parseInt(rs.getObject("id").toString());
			user = new User();
			user.setId(id);
			user.setHeadPic(headPic);
			user.setDesc(desc);
			user.setName(name);
			user.setUserName(userNameDB);
			users.add(user);
		}
		return users;
	}

}
