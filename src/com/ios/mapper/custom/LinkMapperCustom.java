package com.ios.mapper.custom;

import org.apache.ibatis.annotations.Param;

import com.ios.entity.custom.LinkCustom;

import java.util.List;

/**
 * Created by 言曌 on 2017/9/4.
 */
public interface LinkMapperCustom {
	
	//获得链接总数
	public Integer countLink(@Param(value = "status") Integer status) throws Exception;
	
	//获得链接列表
	public List<LinkCustom> listLink(@Param(value = "status") Integer status) throws Exception;
	

}
