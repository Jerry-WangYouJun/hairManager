package com.hair.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hair.dao.UserDao;
import com.hair.mapping.UserMapper;
import com.hair.model.Pagination;
import com.hair.model.User;

@Service
public class UserService {

	@Autowired
	UserMapper  dao ;
	
	@Autowired
	UserDao userDao ;
	
	public User checkUser(User user) {
		
		return dao.selectByUserNoAndPwd(user);
	}

	public void insertCustomer(User user) {
		dao.insert(user);
	}
	
	public Long checkUnique(String userNo) {
		Map map = new HashMap();
		map.put("userNo", userNo);
		return dao.selectUserCountByWhere(map);
		
	}
	
	public List<User> queryList(User user, Pagination page) {
		return userDao.queryList(user ,page);
	}
	
	public int queryListCount(User user  ) {
		return userDao.queryTotal(user);
	}

}
