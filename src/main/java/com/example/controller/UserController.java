package com.example.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.model.User;
import com.example.service.ProductService;
import com.example.service.UserOrderService;
import com.example.service.UserService;

@Controller
@RequestMapping("/user/")
public class UserController {

	@Autowired
	UserService userService;
	
	@Autowired
	ProductService productService;
	
	@Autowired
	UserOrderService userOrderService;
	
	@GetMapping("cart")
	public String getCart() {
		return "cart";
	}
	
	@GetMapping("clearcart")
	public String getClearCart(HttpSession session) {
		userService.clearCart(session);
		return "cart";
	}
	
	@GetMapping("addproduct")
	public String getAddProduct(@RequestParam int id, ModelMap model, HttpSession session) {
		userService.addToCart(id, model, session);
		return "addproduct";
	}
	
	@GetMapping("deleteproduct") 
	public String getDeleteProduct(@RequestParam int id, HttpSession session) {
		userService.removeFromCart(id, session);
		return "cart";
	}
	
	@GetMapping("checkout")
	public String getCheckout(HttpSession session) {
		if (userService.isCartEmpty(session)) {
			return "redirect:/products";
		}
		return "checkout";
	}
	
	@PostMapping("checkout")
	public String postCheckout(HttpSession session, @RequestParam String street,
			@RequestParam String city, @RequestParam String state, @RequestParam String country,
			@RequestParam int zipCode) {
		if (userService.isCartEmpty(session)) {
			return "redirect:/products";
		}	
		session.setAttribute("street", street);
		session.setAttribute("city", city);
		session.setAttribute("state", state);
		session.setAttribute("country", country);
		session.setAttribute("zipCode", zipCode);
		return "redirect:/user/order";
	}
	
	@GetMapping("order")
	public String getOrder(HttpSession session) {
		if (userService.isCartEmpty(session)) {
			return "redirect:/products";
		}
		return "order";
	}
	
	@PostMapping("order")
	public String postOrder(HttpSession session) {
		if (userService.isCartEmpty(session)) {		
			return "redirect:/products";
		}			
		String street = (String) session.getAttribute("street");
		String city = (String) session.getAttribute("city");
		String state = (String) session.getAttribute("state");
		String country = (String) session.getAttribute("country");
		int zipCode = (int) session.getAttribute("zipCode");
		User user = (User) session.getAttribute("user");
		
		userService.clearCart(session);
		userOrderService.addOrder(street, city, state, country, zipCode, user);
		return "orderconfirmed";
	}
	
	@GetMapping("orderconfirmed")
	public String getOrderConfirmed(HttpSession session) {
		if (userService.isCartEmpty(session)) {
			return "redirect:/products";
		}
		return "orderconfirmed";
	}
}
