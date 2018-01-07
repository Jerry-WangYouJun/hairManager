package com.hair.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hair.dao.ImageDao;
import com.hair.mapping.ImageMapper;
import com.hair.model.Pagination;
import com.hair.model.Image;

@Service
public class ImageService {

	@Autowired
	ImageMapper  dao ;
	
	@Autowired
	ImageDao ImageDao ;
	
	public Image checkImage(Image Image) {
		
		return dao.selectByImageNoAndPwd(Image);
	}

	public void insert(Image Image) {
		dao.insert(Image);
	}
	
	public Long checkUnique(String ImageNo) {
		Map map = new HashMap();
		map.put("iname", ImageNo);
		return dao.selectImageCountByWhere(map);
		
	}
	
	public List<Image> queryList(Image Image, Pagination page) {
		return ImageDao.queryList(Image ,page);
	}
	
	public int queryListCount(Image Image  ) {
		return ImageDao.queryTotal(Image);
	}

	public Image selectByPrimaryKey(int id ) {
		return dao.selectByPrimaryKey(id);
	}

	public void updateImage(Image Image) {
		dao.updateByPrimaryKey(Image);
	}

	public void deleteImageById(int id) {
		dao.deleteByPrimaryKey(id);
	}
	
	public List<Image> selectDicByWhere(Image image){
		return dao.selectImageByWhere(image);
	}
}
