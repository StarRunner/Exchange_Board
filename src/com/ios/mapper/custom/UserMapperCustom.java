package com.ios.mapper.custom;

import com.ios.entity.User;
import com.ios.entity.custom.UserCustom;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by 言曌 on 2017/8/24.
 */

@Repository
public interface UserMapperCustom {
	
	//获得用户列表
	public List<UserCustom> listUser() throws Exception;


	//根据用户名或Email获得用户
	public User getUserByNameOrEmail(String str) throws Exception;

	//根据用户名查用户
	public User getUserByName(String name) throws Exception;

	//根据Email查询用户
	public User getUserByEmail(String email) throws Exception;

	//用户的Article数
	public Integer countArticleByUser(@Param(value = "id") Integer id) throws Exception;
}
