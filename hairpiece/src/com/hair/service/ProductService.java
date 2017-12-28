package com.hair.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hair.dao.ProductDao;
import com.hair.mapping.ProductMapper;
import com.hair.model.Pagination;
import com.hair.model.Product;

@Service
public class ProductService {

	@Autowired
	ProductMapper  dao ;
	
	@Autowired
	ProductDao proDao ;
	
	public Product checkProduct(Product pro) {
		
		return dao.selectByProductNoAndPwd(pro);
	}

	public void insertCustomer(Product pro) {
		dao.insert(pro);
	}
	
	public Long checkUnique(String proNo) {
		Product pro = new Product();
		pro.setType(proNo);
		return dao.selectProductCountByWhere(pro);
	}
	
	public List<Product> queryList(Product pro, Pagination page) {
		return proDao.queryList(pro ,page);
	}
	
	public Long queryListCount(Product pro  ) {
		return  dao.selectProductCountByWhere(pro);
	}

	public Product selectByPrimaryKey(int id ) {
		return dao.selectByPrimaryKey(id);
	}

	public void updateProduct(Product pro) {
		dao.updateByPrimaryKey(pro);
	}

	public void deleteProductById(int id) {
		dao.deleteByPrimaryKey(id);
	}
}
