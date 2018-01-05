package com.hair.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hair.dao.MessageDao;
import com.hair.mapping.MessageMapper;
import com.hair.model.Message;
import com.hair.model.Pagination;

@Service
public class MessageService {

	@Autowired
	MessageMapper  dao ;
	
	@Autowired
	MessageDao msgDao;
	
	
	public Message checkMessage(Message Message) {
		
		return dao.selectByMessageNoAndPwd(Message);
	}

	public void insert(Message Message) {
		dao.insert(Message);
	}
	
	public Long checkUnique(String MessageNo) {
		Map map = new HashMap();
		map.put("iname", MessageNo);
		return dao.selectMessageCountByWhere(map);
		
	}

	public Message selectByPrimaryKey(int id ) {
		return dao.selectByPrimaryKey(id);
	}

	public void updateMessage(Message Message) {
		dao.updateByPrimaryKey(Message);
	}

	public void deleteMessageById(int id) {
		dao.deleteByPrimaryKey(id);
	}
	
	public List<Message> selectDicByWhere(Message msg){
		return dao.selectMessageByWhere(msg);
	}

	public List<Message> queryList(Message message, Pagination page) {
		return msgDao.queryList(message, page);
	}

	public int queryListCount(Message message) {
		return msgDao.queryTotal(message);
	}
}
