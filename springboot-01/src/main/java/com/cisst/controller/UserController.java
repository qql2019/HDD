package com.cisst.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.cisst.domin.User;
import com.cisst.service.UserService;

@RestController
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService userService;
	@RequestMapping("/fillyall/{name}")
	public List<User> fillyall(@PathVariable String name){
		List<User> users = userService.fillyByname(name);
		return users;
	}
	

}
