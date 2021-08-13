package com.codingdojo.myproyect.controllers;

import java.security.Principal;
import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.codingdojo.myproyect.models.Categoria;
import com.codingdojo.myproyect.models.Producto;
import com.codingdojo.myproyect.services.CategoriaService;
import com.codingdojo.myproyect.services.ProductoService;


@Controller
public class ProductoController {
	private ProductoService productoService;
	private CategoriaService categoriaService;

	

	public ProductoController(ProductoService productoService, CategoriaService categoriaService) {
		super();
		this.productoService = productoService;
		this.categoriaService = categoriaService;
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

	
	
	
	
	
	///////////////////////cambios/////////////////////////////77
	
	 //////////////////////// Pagina producto //////////////////////////////////////////////
    @RequestMapping("/admin/productos")
    public String productos(@ModelAttribute("producto") Producto producto,
    		Model model) {
    	List<Producto> productos=productoService.allProducto();
    	model.addAttribute("productos", productos);
    	return "productos.jsp";
    }
    //////////////////////// Metodos para producto //////////////////////////////////////////////
    @RequestMapping(value="/admin/eliminar/producto/{productoId}",method=RequestMethod.GET)
    public String eliminarProducto(@PathVariable("productoId") Long productoId) {
    	productoService.deleteProducto(productoId);
        return "redirect:/admin/productos";
    }
    @RequestMapping(value="/admin/crear/producto",method=RequestMethod.POST)
    public String crearProducto(@Valid @ModelAttribute("producto") Producto producto, 
    		BindingResult result) {
		if (result.hasErrors()) {
		       return "redirect:/admin/productos";
		}
		productoService.createOrUpdateProducto(producto);
		 return "redirect:/admin/productos";
    }
    //pagina edicion
    @RequestMapping("/admin/editar/producto/{productoId}")
    public String editarProductos(@ModelAttribute("producto") Producto producto,
    		Model model,@PathVariable("productoId") Long productoId) {
    	Producto prod=productoService.findProducto(productoId);
    	//List<Producto> productos=productoService.allProducto();
    	List<Categoria> categorias=categoriaService.findByNombreNotIn(prod.getCategoriaList());
    	model.addAttribute("categorias", categorias);
    	model.addAttribute("producto", prod);
    	return "editarProducto.jsp";
    }
    //editar producto
    @RequestMapping(value="/admin/actualizar/nombre/producto/{productoId}",method=RequestMethod.POST)
    public String actualizarNombreProducto(@PathVariable("productoId") Long productoId,
    		@ModelAttribute("producto") Producto producto) {
    	
    	Producto prod=productoService.findProducto(productoId);
    	prod.setNombre(producto.getNombre());
    	prod.setDescripcion(producto.getDescripcion());
    	prod.setUrlImagen(producto.getUrlImagen());
    	prod.setUrlImagenChico(producto.getUrlImagenChico());
    	prod.setPrecio(producto.getPrecio());
    	prod.setStock(producto.getStock());
    	productoService.createOrUpdateProducto(prod);
        return "redirect:/admin/productos";
    }
    //agregar categoria a producto
    @RequestMapping(value="/admin/agregar/categoria/producto/{productoId}",method=RequestMethod.POST)
    public String agregarCategoriaProducto(@PathVariable("productoId") Long productoId,
    		@RequestParam("categoriaId") Long categoriaId) {
    	
    	Producto producto=productoService.findProducto(productoId);
    	Categoria categ =categoriaService.findCategoria(categoriaId);
    	
    	producto.getCategoriaList().add(categ);
 
    	productoService.createOrUpdateProducto(producto);
        return "redirect:/admin/editar/producto/"+productoId;
    }
    //eliminar categoria de producto
    @RequestMapping(value="/admin/eliminar/categoria/producto/{productoId}/{categoriaId}",method=RequestMethod.GET)
    public String eliminarCategoriaProducto(@PathVariable("productoId") Long productoId,
    		@PathVariable("categoriaId") Long categoriaId) {
    	
    	Categoria categ=categoriaService.findCategoria(categoriaId);
    	Producto producto =productoService.findProducto(productoId);
    	
    	producto.getCategoriaList().remove(categ);
 
    	productoService.createOrUpdateProducto(producto);
        return "redirect:/admin/editar/producto/"+productoId;
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
