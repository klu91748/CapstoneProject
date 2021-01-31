package com.example.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.model.UserOrder;

@Repository
public interface UserOrderDao extends JpaRepository<UserOrder, Integer> {

}
