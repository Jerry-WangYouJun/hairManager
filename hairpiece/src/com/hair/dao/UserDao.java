package com.hair.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.hair.common.Dialect;
import com.hair.model.Pagination;
import com.hair.model.User;

@Repository
public class UserDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public User checkUser(final User user) {
		String sql = "select *  from t_user  where 1=1 " + whereSql(user) ;
		jdbcTemplate.query(sql, new RowMapper() {
			public Object mapRow(ResultSet rs, int arg1) throws SQLException {
					user.setId(rs.getInt("id"));
					user.setUserNo(rs.getString("userno"));
					user.setUserName(rs.getString("username"));
					user.setRoleId(rs.getString("roleid"));
					user.setEmail(rs.getString("email"));
					user.setPosition(rs.getString("position"));
					user.setSex(rs.getString("sex"));
					user.setTelphone(rs.getString("telphone"));
					user.setRemark(rs.getString("remark"));
				 return null ;
			}
		});
		return user;
	}

	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<User> queryList(User user, Pagination page) {
		String sql = "select *  from t_user  where  1=1  " + whereSql(user);
		String finalSql = Dialect.getLimitString(sql, page.getPageNo(), page.getPageSize(), "MYSQL");
         final  List<User> list =   new ArrayList<>();
         jdbcTemplate.query(finalSql, new RowMapper() {
			public Object mapRow(ResultSet rs, int arg1) throws SQLException {
					User  user = new User(); 
					user.setId(rs.getInt("id"));
					user.setUserNo(rs.getString("userno"));
					user.setUserName(rs.getString("username"));
					user.setRoleId(rs.getString("roleid"));
					user.setEmail(rs.getString("email"));
					user.setPosition(rs.getString("position"));
					user.setSex(rs.getString("sex"));
					user.setTelphone(rs.getString("telphone"));
					user.setRemark(rs.getString("remark"));
					list.add(user);
				 return null ;
			}
		});
		return list;
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public int queryTotal(User user) {
		String sql = "select count(*) total from t_user  where  1=1  " + whereSql(user);
         final  Integer[] arr =  {0};
         jdbcTemplate.query(sql, new RowMapper() {
			public Object mapRow(ResultSet rs, int arg1) throws SQLException {
					arr[0] = rs.getInt("total");
				 return null ;
			}
		});
		return arr[0];
	}
	
	public String whereSql(User user){
		String sql = "";
		if(StringUtils.isNotEmpty(user.getUserNo())){
			sql += " and   userno  like  '%" + user.getUserNo() + "%' ";
		}
		if(StringUtils.isNotEmpty(user.getUserName())){
			sql += " and   username  like  '%" + user.getUserName() + "%' ";
		}
		if(StringUtils.isNotEmpty(user.getRoleId())){
			sql += " and   roleid =  '" + user.getRoleId() + "' ";
		}
		if(user.getId()!=null && StringUtils.isNotEmpty(user.getId()+"")){
			sql += " and   id =  '" + user.getId() + "' ";
		}
		return sql;
	}
}
