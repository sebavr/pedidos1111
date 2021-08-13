package com.codingdojo.myproyect.controllers;


import java.security.Principal;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.codingdojo.myproyect.models.Categoria;
import com.codingdojo.myproyect.models.Producto;
import com.codingdojo.myproyect.models.Role;
import com.codingdojo.myproyect.models.User;
import com.codingdojo.myproyect.services.UserService;
import com.codingdojo.myproyect.validator.UserValidator;

@Controller
public class UserController {
	private UserService userService;
    private UserValidator userValidator;
    public UserController(UserService userService, UserValidator userValidator) {
        this.userService = userService;
        this.userValidator = userValidator;
    }
	
	//////////////////////  Registration && Login && Logout ///////////////////////////////////////////
	@RequestMapping(value= {"/login", "/registration"})
    public String loginReg(@RequestParam(value="error", required=false) String error, 
    		@RequestParam(value="logout", required=false) String logout,
    		@ModelAttribute("user") User user, 
    		Model model) {
        if(error != null) {
            model.addAttribute("errorLog", "Usuario o Password no corresponden");
        }
        if(logout != null) {
            model.addAttribute("logoutMessage", "Logout ok");
        }
        return "loginReg.jsp";
    }
    
    @RequestMapping(value="/registration",method=RequestMethod.POST)
    public String registration(@Valid @ModelAttribute("user") User user, BindingResult result, Model model) {
        userValidator.validate(user, result);
        if (result.hasErrors()) {
        	model.addAttribute("errorReg", "Campos con errores");
    		return "loginReg.jsp";
        }
        User u=userService.findByEmail(user.getEmail());
		if(u!=null) {
			model.addAttribute("errorReg", "Email ya esta registrado");
    		return "loginReg.jsp";
		}
		//elegir rol para registrar el usuario
		if(userService.countAllUsers()==0) {
			userService.saveUserWithAdminRole(user);
		}else {
			userService.saveUserWithUserRole(user);
		}
        return "redirect:/login";
    }
	//////////////////////  Home & admin pages ////////////////////////////////////////////
    @RequestMapping("/")
    public String home(Principal principal, Model model) {
    	if(principal!=null) {
    		String email = principal.getName();
        	User user=userService.findByEmail(email);
            Role role=user.getRole();
            if(role.getName().equals("ROLE_ADMIN")) {
            	return "redirect:/admin/categorias";
            }
    	}
    	return "redirect:/pedir";
    	
    }
	
	@RequestMapping("/admin/dashboard")
    public String adminPage(Principal principal, Model model,@ModelAttribute("producto") Producto producto,
    		@ModelAttribute("categoria") Categoria categoria) {
		String email = principal.getName();
        model.addAttribute("user", userService.findByEmail(email));
        return "dashboard.jsp";
    }
	
	//este es un comentarioasdadasdasd
	
	
}