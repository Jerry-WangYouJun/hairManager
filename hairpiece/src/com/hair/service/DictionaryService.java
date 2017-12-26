package com.hair.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hair.dao.DictionaryDao;
import com.hair.mapping.DictionaryMapper;
import com.hair.model.Pagination;
import com.hair.model.Dictionary;

@Service
public class DictionaryService {

	@Autowired
	DictionaryMapper  dao ;
	
	@Autowired
	DictionaryDao dicDao ;
	
	public Dictionary checkDictionary(Dictionary dic) {
		
		return dao.selectByDictionaryNoAndPwd(dic);
	}

	public void insertCustomer(Dictionary dic) {
		dao.insert(dic);
	}
	
	public Long checkUnique(String dicNo) {
		Map map = new HashMap();
		map.put("dicNo", dicNo);
		return dao.selectDictionaryCountByWhere(map);
		
	}
	
	public List<Dictionary> queryList(Dictionary dic, Pagination page) {
		return dicDao.queryList(dic ,page);
	}
	
	public int queryListCount(Dictionary dic  ) {
		return dicDao.queryTotal(dic);
	}

	public Dictionary selectByPrimaryKey(int id ) {
		return dao.selectByPrimaryKey(id);
	}

	public void updateDictionary(Dictionary dic) {
		dao.updateByPrimaryKey(dic);
	}

	public void deleteDictionaryById(int id) {
		dao.deleteByPrimaryKey(id);
	}
}
