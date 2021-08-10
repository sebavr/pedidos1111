package com.codingdojo.myproyect.controllers;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.codingdojo.myproyect.models.Categoria;
import com.codingdojo.myproyect.services.CategoriaService;
import com.codingdojo.myproyect.services.UserService;

@Controller
public class PedidoController {
	private UserService userService;
	private CategoriaService categoriaService;
    public PedidoController(UserService userService,CategoriaService categoriaService) {
        this.userService = userService;
        this.categoriaService = categoriaService;
    }
    
    @RequestMapping("/pedir")
    public String pedir(Model model){
    	List<Categoria> categorias=categoriaService.allCategoria();
    	model.addAttribute("categorias", categorias);
    	return "pedir.jsp";
    }
}
