package com.hair.mapping;

import java.util.List;
import java.util.Map;

import com.hair.model.Dictionary;

public interface DictionaryMapper {
	public int deleteByPrimaryKey(Integer id);

    public int insert(Dictionary record);

    public int insertSelective(Dictionary record);

    public Dictionary selectByPrimaryKey(Integer id);

    public int updateByPrimaryKeySelective(Dictionary record);

    public int updateByPrimaryKey(Dictionary record);
    
    public Dictionary selectByDictionaryNoAndPwd(Dictionary user);

	public List<Dictionary> selectDictionaryByWhere(Map params);

	public Long selectDictionaryCountByWhere(Map params);
}
