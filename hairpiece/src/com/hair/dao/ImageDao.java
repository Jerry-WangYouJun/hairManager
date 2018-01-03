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
import com.hair.model.Image;

@Repository
public class ImageDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public Image checkImage(final Image image) {
		String sql = "select *  from t_image  where 1=1 " + whereSql(image) ;
		jdbcTemplate.query(sql, new RowMapper() {
			public Object mapRow(ResultSet rs, int arg1) throws SQLException {
					image.setId(rs.getInt("id"));
					image.setIpath(rs.getString("ipath"));
					image.setIname(rs.getString("iname"));
					image.setContect(rs.getString("contect"));
				 return null ;
			}
		});
		return image;
	}

	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Image> queryList(Image image, Pagination page) {
		String sql = "select *  from t_image  where  1=1  " + whereSql(image);
		String finalSql = Dialect.getLimitString(sql, page.getPageNo(), page.getPageSize(), "MYSQL");
         final  List<Image> list =   new ArrayList<>();
         jdbcTemplate.query(finalSql, new RowMapper() {
			public Object mapRow(ResultSet rs, int arg1) throws SQLException {
					Image  image = new Image(); 
					image.setId(rs.getInt("id"));
					image.setIpath(rs.getString("ipath"));
					image.setIname(rs.getString("iname"));
					image.setContect(rs.getString("contect"));
					list.add(image);
				 return null ;
			}
		});
		return list;
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public int queryTotal(Image image) {
		String sql = "select count(*) total from t_image  where  1=1  " + whereSql(image);
         final  Integer[] arr =  {0};
         jdbcTemplate.query(sql, new RowMapper() {
			public Object mapRow(ResultSet rs, int arg1) throws SQLException {
					arr[0] = rs.getInt("total");
				 return null ;
			}
		});
		return arr[0];
	}
	
	public String whereSql(Image image){
		String sql = "";
		if(image.getId()!=null && StringUtils.isNotEmpty(image.getId()+"")){
			sql += " and   id =  '" + image.getId() + "' ";
		}
		if(image.getType()!=null && StringUtils.isNotEmpty(image.getType()+"")){
			sql += " and   type =  '" + image.getType() + "' ";
		}
		return sql;
	}
}
