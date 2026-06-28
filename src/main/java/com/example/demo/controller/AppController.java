package com.example.demo.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class AppController {
	
	
	@GetMapping("home")
	public String home() {
		
		return "helo world again again";
		
	}
	
	@GetMapping("login")
	public String login() {
		
		return "login again";
	}
	
	
	
	

}
