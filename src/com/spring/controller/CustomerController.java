package com.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.entity.Customer;
import com.spring.service.CustomerService;

@Controller
@RequestMapping("/customer")
public class CustomerController {
//	// need to inject the customer dao
//	
// @Autowired //spring will scan for component that implenments CustomerDAO interface
//	private CustomerDAO customerDAO;

	@Autowired
	private CustomerService customerService;

	// @RequestMapping("/list")
	@GetMapping("/list")
	public String listCustomers(Model theModel) {

		// get customers from the service
		List<Customer> theCustomers = customerService.getCustomers();

		// add the customers to the model
		theModel.addAttribute("customers", theCustomers);

		return "list-customers";
	}

	@GetMapping("/addCustomerForm")
	public String addCustomerForm(Model theModel) {
		Customer theCustomer = new Customer();
		theModel.addAttribute("customer", theCustomer);
		return "customer-form";
	}

	@PostMapping("/saveCustomer")
	public String saveCustomer(@ModelAttribute("customer") Customer theCustomer) {

		customerService.saveCustomer(theCustomer);
		return "redirect:/customer/list";

	}
	@GetMapping("/UpdateForm")
	public String UpdateForm(@RequestParam("customerId") int theId, Model theModel) {
		
		Customer theCustomer=customerService.getCustomer(theId);
		theModel.addAttribute("customer", theCustomer);
		return "customer-form";
		
	}
	@GetMapping("/delete")
	public String deleteCustomer(@RequestParam("customerId") int theId) {
		customerService.deleteCustomer(theId);
		return "redirect:/customer/list";
		
	}

}