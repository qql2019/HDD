package com.cisst.service;

import java.util.List;

import com.cisst.domin.User;
/**
 * 业务层
 * @author Administrator
 *
 */
public interface UserService {
 /*List<User> fillyall();*/
 List<User> fillyByname(String name);
}
