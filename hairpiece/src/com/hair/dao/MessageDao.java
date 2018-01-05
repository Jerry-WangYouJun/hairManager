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
import com.hair.model.Message;

@Repository
public class MessageDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Message> queryList(Message message, Pagination page) {
		String sql = "select  min(time ) time  , contect , name , msg  , id "
				+ " from t_msg  where  1=1  " + whereSql(message) + " group by contect";
		String finalSql = Dialect.getLimitString(sql, page.getPageNo(), page.getPageSize(), "MYSQL");
         final  List<Message> list =   new ArrayList<>();
         jdbcTemplate.query(finalSql, new RowMapper() {
			public Object mapRow(ResultSet rs, int arg1) throws SQLException {
					Message  message = new Message(); 
					message.setId(rs.getInt("id"));
					message.setTime(rs.getString("time"));
					message.setName(rs.getString("name"));
					message.setMsg(rs.getString("msg"));
					message.setContect(rs.getInt("contect"));
					list.add(message);
				 return null ;
			}
		});
		return list;
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public int queryTotal(Message message) {
		String sql = "select count(*) total from ( select id  from t_msg  where  1=1  "
	+  whereSql(message) + " group by contect ) a  " ;
         final  Integer[] arr =  {0};
         jdbcTemplate.query(sql, new RowMapper() {
			public Object mapRow(ResultSet rs, int arg1) throws SQLException {
					arr[0] = rs.getInt("total");
				 return null ;
			}
		});
		return arr[0];
	}
	
	public String whereSql(Message message){
		String sql = "";
		if(message.getId()!=null && StringUtils.isNotEmpty(message.getId()+"")){
			sql += " and   id =  '" + message.getId() + "' ";
		}
		if(message.getContect()!=null && StringUtils.isNotEmpty(message.getContect()+"")){
			sql += " and   contect =  '" + message.getContect() + "' ";
		}
		if(message.getName()!=null && StringUtils.isNotEmpty(message.getName()+"")){
			sql += " and   name like   '%" + message.getName() + "%' ";
		}
		return sql;
	}
}
