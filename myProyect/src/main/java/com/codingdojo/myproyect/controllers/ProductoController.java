package com.codingdojo.myproyect.controllers;

import java.security.Principal;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.codingdojo.myproyect.models.Producto;
import com.codingdojo.myproyect.services.ProductoService;


@Controller
public class ProductoController {
	private ProductoService productoService;

	public ProductoController(ProductoService productoService) {
	
		this.productoService = productoService;
	}

	@PostMapping("/addproducto")
	public String addproducto(Principal principal,@ModelAttribute("producto") Producto producto, BindingResult result,RedirectAttributes redirectAttributes) {
		if (result.hasErrors()) {
			redirectAttributes.addFlashAttribute("errorproducto", "Campos invalidos");
    		return "redirect:/admin/dashboard";
		    }
		productoService.createOrUpdateProducto(producto);
	
		return "redirect:/admin/dashboard";
	}
	@RequestMapping("/producto/{id}")
	public String detallesProducto(@PathVariable("id") Long id,Model model) {
		Producto producto= productoService.findProducto(id);
		if(producto==null) {
			return "redirect:/pedir";
		}
		model.addAttribute("producto", producto);
		return "detallesProducto.jsp";
	}
}
