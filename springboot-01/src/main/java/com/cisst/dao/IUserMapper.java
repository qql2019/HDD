package com.cisst.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.cisst.domin.User;

@Mapper
public interface IUserMapper {
	@Select("select * from user where name like '%${value}%'")
public List<User> fillyByname(String name);
}
