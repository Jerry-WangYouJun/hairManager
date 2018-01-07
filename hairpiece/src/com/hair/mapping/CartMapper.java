package com.hair.mapping;

import java.util.List;
import java.util.Map;

import com.hair.model.Cart;

public interface CartMapper {
	public int deleteByPrimaryKey(Integer id);

    public int insert(Cart record);

    public int insertSelective(Cart record);

    public Cart selectByPrimaryKey(Integer id);

    public int updateByPrimaryKeySelective(Cart record);

    public int updateByPrimaryKey(Cart record);
    
    public Cart selectByCartNoAndPwd(Cart user);

	public List<Cart> selectCartByWhere(Cart params);

	public Long selectCartCountByWhere(Map params);
}
