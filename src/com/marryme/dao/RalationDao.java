package com.marryme.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.marryme.bean.User;
import com.marryme.bean.UserRalation;

public class RalationDao {

	Connection connection;
	public void delete(int uid, int rid) throws ClassNotFoundException, SQLException {
		connection = MysqlConn.getConn();
		String sql = "delete from ralation where userId="+uid+  " and relateId="+rid+" and type=1";
		PreparedStatement prep = connection.prepareStatement(sql);
		prep.executeUpdate();
		
		connection = MysqlConn.getConn();
		String sql2 = "delete from ralation where userId="+rid+  " and relateId="+uid+" and type=2";
		PreparedStatement prep2 = connection.prepareStatement(sql2);
		prep2.executeUpdate();
		// 关闭流
		prep.close();
		prep2.close();
		connection.close();
	}

	public void focus(int uid, int rid) throws ClassNotFoundException, SQLException {
		connection = MysqlConn.getConn();
		String sql = "insert into ralation(userId,relateId,type)values(?,?,?)";
		PreparedStatement prep = connection.prepareStatement(sql);
		prep.setObject(1, uid);
		prep.setObject(2, rid);
		prep.setObject(3, "1");
		prep.executeUpdate();
		String sql2 = "insert into ralation(userId,relateId,type)values(?,?,?)";
		PreparedStatement prep2 = connection.prepareStatement(sql2);
		prep2.setObject(1, rid);
		prep2.setObject(2, uid);
		prep2.setObject(3, "2");
		prep2.executeUpdate();
		// 关闭流
		prep.close();
		connection.close();
	}

	public List<User> findUsersList(int id, int type) throws ClassNotFoundException, SQLException {
		connection = MysqlConn.getConn();
		List<User> users = new ArrayList<User>();
		List<UserRalation> raL = new ArrayList<>();
		String sql = "select * from ralation where userId=? and type=" + type;
		PreparedStatement prep = connection.prepareStatement(sql);
		prep.setObject(1, id);
		ResultSet rs = prep.executeQuery();
		while (rs.next()) {
			UserRalation ra = new UserRalation();
			ra.setUserId(Integer.parseInt(rs.getObject("userId").toString()));
			ra.setRelateId(Integer.parseInt(rs.getObject("relateId").toString()));
			ra.setType(rs.getObject("type").toString());
			raL.add(ra);
		}

		for (UserRalation userRalation : raL) {
			User userDb = new User();
			userDb=findUserById(userRalation.getRelateId());
			users.add(userDb);
		}

		return users;
	}

	public User findUserById(int id) throws SQLException, ClassNotFoundException {
		User user = null;
		connection = MysqlConn.getConn();
		List<User> users = new ArrayList<User>();
		String sql = "select * from user where id=?";
		PreparedStatement prep = connection.prepareStatement(sql);
		prep.setObject(1, id);
		ResultSet rs = prep.executeQuery();
		while (rs.next()) {
			user = new User();
			user.setId(Integer.parseInt(rs.getObject("id").toString()));
			user.setAge(Integer.parseInt(rs.getObject("age").toString()));
			user.setName(rs.getObject("name").toString());
			user.setHeadPic(rs.getObject("headPic").toString());
			user.setDesc(rs.getObject("desca").toString());
			users.add(user);
		}
		return users.get(0);
	}
}
