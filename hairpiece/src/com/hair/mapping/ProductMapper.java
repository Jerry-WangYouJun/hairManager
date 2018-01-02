package com.hair.mapping;

import java.util.List;
import java.util.Map;

import com.hair.model.Product;

public interface ProductMapper {
    public int deleteByPrimaryKey(Integer id);

    public int insert(Product record);

    public int insertSelective(Product record);

    public Product selectByPrimaryKey(Integer id);

    public int updateByPrimaryKeySelective(Product record);

    public int updateByPrimaryKey(Product record);
    /**
     * 根据用户名和密码查找用户
     * @param user
     * @return
     */
    public Product selectByProductNoAndPwd(Product record );

	public List<Product> selectProductByWhere(Product pro);

	public Long selectProductCountByWhere(Product record);
}