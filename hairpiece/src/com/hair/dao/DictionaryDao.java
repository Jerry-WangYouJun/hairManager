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
import com.hair.model.Dictionary;

@Repository
public class DictionaryDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public Dictionary checkDictionary(final Dictionary dic) {
		String sql = "select *  from t_dictionary  where 1=1 " + whereSql(dic) ;
		jdbcTemplate.query(sql, new RowMapper() {
			public Object mapRow(ResultSet rs, int arg1) throws SQLException {
					dic.setId(rs.getInt("id"));
					dic.setCode(rs.getString("code"));
					dic.setName(rs.getString("name"));
					dic.setRemark(rs.getString("remark"));
				 return null ;
			}
		});
		return dic;
	}

	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Dictionary> queryList(Dictionary dic, Pagination page) {
		String sql = "select *  from t_dictionary  where  1=1  " + whereSql(dic);
		String finalSql = Dialect.getLimitString(sql, page.getPageNo(), page.getPageSize(), "MYSQL");
         final  List<Dictionary> list =   new ArrayList<>();
         jdbcTemplate.query(finalSql, new RowMapper() {
			public Object mapRow(ResultSet rs, int arg1) throws SQLException {
					Dictionary  dic = new Dictionary(); 
					dic.setId(rs.getInt("id"));
					dic.setCode(rs.getString("code"));
					dic.setName(rs.getString("name"));
					dic.setRemark(rs.getString("remark"));
					list.add(dic);
				 return null ;
			}
		});
		return list;
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public int queryTotal(Dictionary dic) {
		String sql = "select count(*) total from t_dictionary  where  1=1  " + whereSql(dic);
         final  Integer[] arr =  {0};
         jdbcTemplate.query(sql, new RowMapper() {
			public Object mapRow(ResultSet rs, int arg1) throws SQLException {
					arr[0] = rs.getInt("total");
				 return null ;
			}
		});
		return arr[0];
	}
	
	public String whereSql(Dictionary dic){
		String sql = "";
		if(dic.getId()!=null && StringUtils.isNotEmpty(dic.getId()+"")){
			sql += " and   id =  '" + dic.getId() + "' ";
		}
		return sql;
	}
}
