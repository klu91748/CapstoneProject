package com.example.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.model.Product;
import com.example.service.ProductService;
import com.example.service.UserOrderService;
import com.example.service.UserService;

@Controller
@RequestMapping("/")
public class AllController {

	@Autowired
	UserService userService;
	
	@Autowired
	ProductService productService;
	
	@Autowired
	UserOrderService userOrderService;


	@GetMapping({"/","/home"})
	public String getHomePage() {
		//userOrderService.test();
		return "home";
	}
	
	@GetMapping("about")
	public String getAbout() {
		return "about";
	}
	
	@GetMapping("register")
	public String getRegister() {
		return "register";
	}
	
	@PostMapping("register")
	public String postRegister(@RequestParam String name, @RequestParam String pass, @RequestParam String fullName, 
			@RequestParam String email, @RequestParam long phone, @RequestParam String street, 
			@RequestParam String city, @RequestParam String state, @RequestParam String country, 
			@RequestParam int zipCode, ModelMap model) {
		if (!userService.register(name, pass, fullName, email, phone, 
				street, city, state, country, zipCode)) {
			model.addAttribute("errorMessage", "User already exists!");
			return "register";
		}
		return "registersuccess";
	}
	
	@GetMapping("login")
	public String getLogin(HttpServletRequest request, HttpSession session) {
		String referrer = request.getHeader("Referer");
		session.setAttribute("prevURL", referrer);
		return "login";
	}
	
	@GetMapping("logout")
	public String getLogout() {
		return "logout";
	}
	
	@GetMapping("/403")
	public String get403() {
		return "403";		
	}
	
	@GetMapping("error")
	public String getError() {
		return "error";
	}
	
	@GetMapping("products")
	public String getProducts(ModelMap model) {
		model.put("products", productService.findAllProducts());
		return "products";
	}
	
	@GetMapping("viewproduct")
	public String getProduct(ModelMap model, @RequestParam int id) {
		Product product = productService.findProduct(id);
		model.put("product", product);
		return "viewproduct";
	}
}
