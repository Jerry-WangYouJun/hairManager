package com.hair.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hair.dao.ProductDao;
import com.hair.mapping.CartMapper;
import com.hair.model.Cart;
import com.hair.model.Product;

@Service
public class CartService {

	@Autowired
	CartMapper  dao ;
	
	@Autowired
	ProductDao proDao;
	
	public int insert(Cart Cart) {
		return dao.insert(Cart);
	}
	
	public Cart selectByPrimaryKey(int id ) {
		return dao.selectByPrimaryKey(id);
	}

	public void updateCart(Cart Cart) {
		dao.updateByPrimaryKey(Cart);
	}

	public void deleteCartById(int id) {
		dao.deleteByPrimaryKey(id);
	}
	
	public List<Cart> selectDicByWhere(Cart cart){
		return dao.selectCartByWhere(cart);
	}

	public List<Product> selectProByUser(Cart cart) {
		// TODO Auto-generated method stub
		return proDao.queryListForCart(cart );
	}
}
