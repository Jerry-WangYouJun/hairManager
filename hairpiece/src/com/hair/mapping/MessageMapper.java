package com.hair.mapping;

import java.util.List;
import java.util.Map;

import com.hair.model.Message;

public interface MessageMapper {
	public int deleteByPrimaryKey(Integer id);

    public int insert(Message record);

    public int insertSelective(Message record);

    public Message selectByPrimaryKey(Integer id);

    public int updateByPrimaryKeySelective(Message record);

    public int updateByPrimaryKey(Message record);
    
    public Message selectByMessageNoAndPwd(Message msg);

	public List<Message> selectMessageByWhere(Message params);

	public Long selectMessageCountByWhere(Map params);
}
