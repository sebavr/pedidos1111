package com.codingdojo.myproyect.controllers;



import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.codingdojo.myproyect.models.Categoria;
import com.codingdojo.myproyect.services.CategoriaService;

@Controller
public class CategoriaController {
	private CategoriaService categoriaService;
    public CategoriaController(CategoriaService categoriaService) {
        this.categoriaService = categoriaService;
    }
   
    @RequestMapping(value="/crear/categoria",method=RequestMethod.POST)
    public String adminPage(@Valid @ModelAttribute("categoria") Categoria categoria, 
    		BindingResult result) {
		if (result.hasErrors()) {
		       return "redirect:/admin/dashboard";
		}
		categoriaService.createOrUpdateCategoria(categoria);
		
        return "redirect:/admin/dashboard";
    }
   
}