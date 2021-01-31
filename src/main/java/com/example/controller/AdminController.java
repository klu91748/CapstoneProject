package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.model.Product;
import com.example.service.ProductService;
import com.example.service.UserService;

@Controller
@RequestMapping("/admin/")
public class AdminController {

	@Autowired
	ProductService productService;
	
	@Autowired
	UserService userService;
	
	@GetMapping("adminhome")
	public String getAdminHome() {
		return "adminhome";
	}
	
	@GetMapping("productinventory")
	public String getProductInventory(ModelMap model) {
		model.put("products", productService.findAllProducts());
		return "productinventory";
	}
	
	@PostMapping("productinventory")
	public String postProductInventory(@RequestParam String url, @RequestParam String name,
			@RequestParam String category, @RequestParam String condition, @RequestParam double price) {
		productService.addProduct(url, name, category, condition, price);
		return "redirect:/admin/productinventory";
	}
	
	@GetMapping("updateproduct")
	public String updateProduct(@RequestParam int id, ModelMap model) {
		Product product = productService.findProduct(id);
		model.put("product", product);
		model.put("products", productService.findAllProducts());
		return "updateinventory";
	}
	
	@PostMapping("updateproduct")
	public String postProduct(@RequestParam int id, @RequestParam String url, @RequestParam String name,
			@RequestParam String category, @RequestParam String condition, @RequestParam double price, 
			ModelMap model) {
		productService.updateProduct(id, url, name, category, condition, price);
		model.put("products", productService.findAllProducts());
		return "redirect:/admin/productinventory";
	}
	
	@GetMapping("deleteproduct")
	public String deleteProduct(@RequestParam int id) {
		productService.deleteProduct(id);
		return "redirect:/admin/productinventory";
	}
	
	@GetMapping("customermanagement")
	public String getCustomerMangement(ModelMap model) {
		model.addAttribute("users", userService.findAllUsers());
		return "customermanagement";
	}
	
	@GetMapping("edituser")
	public String getEditUser(@RequestParam String name, ModelMap model) {
		model.addAttribute("useredit", userService.findUser(name));
		model.addAttribute("users", userService.findAllUsers());
		return "edituser";
	}
	
	@PostMapping("edituser")
	public String postEditUser(@RequestParam String name, @RequestParam String fullName,
			@RequestParam String email, @RequestParam long phone, ModelMap model) {
		userService.updateUser(name, fullName, email, phone);
		model.addAttribute("users", userService.findAllUsers());
		return "customermanagement";
	}	
}
