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
import com.hair.model.Product;

@Repository
public class ProductDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public Product checkProduct(final Product pro) {
		String sql = "select *  from t_product  where 1=1 " + whereSql(pro) ;
		jdbcTemplate.query(sql, new RowMapper() {
			public Object mapRow(ResultSet rs, int arg1) throws SQLException {
					pro.setId(rs.getInt("id"));
					pro.setGrade(rs.getString("grade"));
					pro.setHairColor(rs.getString("hariColor"));
					pro.setHairLen(rs.getDouble("hairLen"));
					pro.setHairType(rs.getString("hairType"));
					pro.setItems(rs.getDouble("items"));
					pro.setPermed(rs.getString("permed"));
					pro.setSubType(rs.getString("subType"));
					pro.setTexture(rs.getString("texture"));
					pro.setType(rs.getString("type"));
					pro.setUnit(rs.getDouble("unit"));
					pro.setRemark(rs.getString("remark"));
				 return null ;
			}
		});
		return pro;
	}

	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Product> queryList(Product pro, Pagination page) {
		String sql = "select *  from t_product  where  1=1  " + whereSql(pro);
		String finalSql = Dialect.getLimitString(sql, page.getPageNo(), page.getPageSize(), "MYSQL");
         final  List<Product> list =   new ArrayList<>();
         jdbcTemplate.query(finalSql, new RowMapper() {
			public Object mapRow(ResultSet rs, int arg1) throws SQLException {
					Product  pro = new Product(); 
					pro.setId(rs.getInt("id"));
					pro.setGrade(rs.getString("grade"));
					pro.setHairColor(rs.getString("hairColor"));
					pro.setHairLen(rs.getDouble("hairLen"));
					pro.setHairType(rs.getString("hairType"));
					pro.setItems(rs.getDouble("items"));
					pro.setPermed(rs.getString("permed"));
					pro.setSubType(rs.getString("subType"));
					pro.setTexture(rs.getString("texture"));
					pro.setType(rs.getString("type"));
					pro.setUnit(rs.getDouble("unit"));
					pro.setRemark(rs.getString("remark"));
					list.add(pro);
				 return null ;
			}
		});
		return list;
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public int queryTotal(Product pro) {
		String sql = "select count(*) total from t_product  where  1=1  " + whereSql(pro);
         final  Integer[] arr =  {0};
         jdbcTemplate.query(sql, new RowMapper() {
			public Object mapRow(ResultSet rs, int arg1) throws SQLException {
					arr[0] = rs.getInt("total");
				 return null ;
			}
		});
		return arr[0];
	}
	
	public String whereSql(Product pro){
		String sql = "";
		if(pro.getId()!=null && StringUtils.isNotEmpty(pro.getId()+"")){
			sql += " and   id =  '" + pro.getId() + "' ";
		}
		return sql;
	}
}
