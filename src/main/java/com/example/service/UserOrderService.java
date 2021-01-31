package com.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.UserOrderDao;
import com.example.model.User;
import com.example.model.UserOrder;

@Service
public class UserOrderService {
	
	@Autowired
	UserOrderDao userOrderDao;
	
	@Autowired
	UserService userService;
	
	public void addOrder(String street, String city, String state, String country, int zipCode, User user) {
		UserOrder userOrder = new UserOrder(street, city, state, country, zipCode, user);
		userOrderDao.save(userOrder);
	}
}
