package com.cisst.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cisst.dao.IUserMapper;

import com.cisst.domin.User;
import com.cisst.service.UserService;
@Service("userService")
public class UserServiceImpl implements UserService {
/*	@Autowired
private UserDao userDao;*/
	@Autowired
	private IUserMapper userMapper;

	/*public List<User> fillyall() {
	
		return userMapper.fillyall();
	}*/
	@Override
	public List<User> fillyByname(String name) {
		// TODO Auto-generated method stub
		return userMapper.fillyByname(name);
	}

}
