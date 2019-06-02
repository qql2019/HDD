package com.cisst.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.cisst.domin.User;
@Repository("userDao")
public interface UserDao extends JpaRepository<User,Integer> {
	 public List<User> fillyall();
}
