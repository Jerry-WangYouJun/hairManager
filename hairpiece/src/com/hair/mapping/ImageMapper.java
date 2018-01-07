package com.hair.mapping;

import java.util.List;
import java.util.Map;

import com.hair.model.Image;

public interface ImageMapper {
	public int deleteByPrimaryKey(Integer id);

    public int insert(Image record);

    public int insertSelective(Image record);

    public Image selectByPrimaryKey(Integer id);

    public int updateByPrimaryKeySelective(Image record);

    public int updateByPrimaryKey(Image record);
    
    public Image selectByImageNoAndPwd(Image user);

	public List<Image> selectImageByWhere(Image image);

	public Long selectImageCountByWhere(Map params);
}
