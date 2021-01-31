package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.ProductDao;
import com.example.model.Product;

@Service
public class ProductService {
	
	@Autowired
	ProductDao productDao;
	
	public Product findProduct(int id) {
		Product product = productDao.findById(id).get();
		return product;
	}
	
    public List<Product> findAllProducts() {
        return (List<Product>) productDao.findAll();
    }
	
	public void addProduct(String url, String name, String category, String condition, double price) {
		Product product = new Product(url, name, category, condition, price);
		productDao.save(product);
	}
	
	public void updateProduct(int id, String url, String name, String category, String condition, double price) {
		Product product = findProduct(id);
		product.setUrl(url);
		product.setName(name);
		product.setCategory(category);
		product.setCondition(condition);
		product.setPrice(price);
		productDao.save(product);
	}
	
	public void deleteProduct(int id) {
		productDao.deleteById(id);
	}
}
