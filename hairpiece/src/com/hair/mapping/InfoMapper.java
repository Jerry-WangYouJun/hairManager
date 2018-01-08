package com.hair.mapping;

import com.hair.model.Infomation;

public interface InfoMapper {

    public Infomation selectByPrimaryKey(Integer id);


    public int updateByPrimaryKey(Infomation record);
    

}
