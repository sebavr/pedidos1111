package com.codingdojo.myproyect.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.codingdojo.myproyect.models.Categoria;
import com.codingdojo.myproyect.models.Producto;
import com.codingdojo.myproyect.services.CategoriaService;
import com.codingdojo.myproyect.services.ProductoService;

@Controller
public class CategoriaController {
	private CategoriaService categoriaService;
	private ProductoService productoService;
    public CategoriaController(CategoriaService categoriaService,ProductoService productoService) {
        this.categoriaService = categoriaService;
        this.productoService = productoService;
    }
    //////////////////////// Pagina categorias //////////////////////////////////////////////
    @RequestMapping("/admin/categorias")
    public String categorias(@ModelAttribute("categoria") Categoria categoria,
    		Model model) {
    	List<Categoria> categorias=categoriaService.allCategoria();
    	model.addAttribute("categorias", categorias);
    	return "categorias.jsp";
    }
    //////////////////////// Metodos para categoria //////////////////////////////////////////////
    @RequestMapping(value="/admin/eliminar/categoria/{categoriaId}",method=RequestMethod.GET)
    public String eliminarCategoria(@PathVariable("categoriaId") Long categoriaId) {
    	categoriaService.deleteCategoria(categoriaId);
        return "redirect:/admin/categorias";
    }
    @RequestMapping(value="/admin/crear/categoria",method=RequestMethod.POST)
    public String crearCategoria(@Valid @ModelAttribute("categoria") Categoria categoria, 
    		BindingResult result) {
		if (result.hasErrors()) {
		       return "redirect:/admin/categorias";
		}
		categoriaService.createOrUpdateCategoria(categoria);
        return "redirect:/admin/categorias";
    }
    //pagina edicion
    @RequestMapping("/admin/editar/categoria/{categoriaId}")
    public String editarCategorias(@ModelAttribute("categoria") Categoria categoria,
    		Model model,@PathVariable("categoriaId") Long categoriaId) {
    	Categoria categ=categoriaService.findCategoria(categoriaId);
    	//List<Producto> productos=productoService.allProducto();
    	List<Producto> productos=productoService.findByNombreNotIn(categ.getProductoList());
    	model.addAttribute("productos", productos);
    	model.addAttribute("categoria", categ);
    	return "editarCategoria.jsp";
    }
    //cambia nombre
    @RequestMapping(value="/admin/actualizar/nombre/categoria/{categoriaId}",method=RequestMethod.POST)
    public String actualizarNombreCategoria(@PathVariable("categoriaId") Long categoriaId,
    		@ModelAttribute("categoria") Categoria categoria) {
    	
    	Categoria categ=categoriaService.findCategoria(categoriaId);
    	categ.setNombre(categoria.getNombre());
    	categoriaService.createOrUpdateCategoria(categ);
        return "redirect:/admin/categorias";
    }
    //agregar producto a categoria
    @RequestMapping(value="/admin/agregar/producto/categoria/{categoriaId}",method=RequestMethod.POST)
    public String agregarProductoCategoria(@PathVariable("categoriaId") Long categoriaId,
    		@RequestParam("productoId") Long productoId) {
    	
    	Categoria categ=categoriaService.findCategoria(categoriaId);
    	Producto producto =productoService.findProducto(productoId);
    	
    	categ.getProductoList().add(producto);
 
    	categoriaService.createOrUpdateCategoria(categ);
        return "redirect:/admin/editar/categoria/"+categoriaId;
    }
    //eliminar producto de categoria
    @RequestMapping(value="/admin/eliminar/producto/categoria/{categoriaId}/{productoId}",method=RequestMethod.GET)
    public String eliminarProductoCategoria(@PathVariable("categoriaId") Long categoriaId,
    		@PathVariable("productoId") Long productoId) {
    	
    	Categoria categ=categoriaService.findCategoria(categoriaId);
    	Producto producto =productoService.findProducto(productoId);
    	
    	categ.getProductoList().remove(producto);
 
    	categoriaService.createOrUpdateCategoria(categ);
        return "redirect:/admin/editar/categoria/"+categoriaId;
    }    
}