package com.example.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import com.example.dao.UserDao;
import com.example.model.Product;
import com.example.model.User;

@SuppressWarnings("unchecked")
@Service
public class UserService {

	@Autowired
	private UserDao userDao;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	UserDetailsService userDetailsService;
	
	@Autowired
	ProductService productService;
	
	
	public void addToCart(int id, ModelMap model, HttpSession session) {
		Product product = productService.findProduct(id);
		Map<Product, Integer> cart = new HashMap<>();
		if (session.getAttribute("cart") != null) {
			cart = (Map<Product, Integer>) session.getAttribute("cart");
		}
		cart.put(product, cart.getOrDefault(product, 0) + 1);
		model.put("product", product);
		session.setAttribute("cart", cart);
	}
	
	public boolean isCartEmpty(HttpSession session) {
		Map<Product, Integer> cart = (Map<Product, Integer>) session.getAttribute("cart");
		if (cart == null || cart.size() == 0) {
			return true;
		}
		return false;
	}
	
	public void removeFromCart(int id, HttpSession session) {
		Product product = productService.findProduct(id);
		Map<Product, Integer> cart = (Map<Product, Integer>) session.getAttribute("cart");
		cart.remove(product);
		session.setAttribute("cart", cart);
	}
	
	public void clearCart(HttpSession session) {
		session.setAttribute("cart", new HashMap<>());
	}
	
	public boolean register(String name, String pass, String fullName, String email, long phone, 
			String street, String city, String state, String country, int zipCode) {
		User user = userDao.findById(name).orElse(null);
		if (user != null) {
			return false;
		}
		user = new User(name, passwordEncoder.encode(pass), fullName, email, phone, 
				street, city, state, country, zipCode, "USER");

		userDao.save(user);
		return true;
	}
	
	public User findUser(String name) {
		return userDao.findById(name).get();
	}
	
    public List<User> findAllUsers() {
        return (List<User>) userDao.findAll();
    }

	public void updateUser(String name, String fullName, String email, long phone) {
		User user = userDao.findById(name).get();
		user.setFullName(fullName);
		user.setEmail(email);
		user.setPhone(phone);
		userDao.save(user);
	}
}
