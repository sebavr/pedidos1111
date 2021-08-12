package com.codingdojo.myproyect.controllers;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.codingdojo.myproyect.models.Categoria;
import com.codingdojo.myproyect.models.Pedido;
import com.codingdojo.myproyect.models.Producto;
import com.codingdojo.myproyect.models.ProductoPedido;
import com.codingdojo.myproyect.models.User;
import com.codingdojo.myproyect.services.CategoriaService;
import com.codingdojo.myproyect.services.PedidoService;
import com.codingdojo.myproyect.services.ProductoPedidoService;
import com.codingdojo.myproyect.services.ProductoService;
import com.codingdojo.myproyect.services.UserService;

@Controller
public class PedidoController {
	private UserService userService;
	private CategoriaService categoriaService;
	private ProductoService productoService;
	private PedidoService pedidoService;
	private ProductoPedidoService productoPedidoService;
    public PedidoController(UserService userService,CategoriaService categoriaService,ProductoService productoService,
    		PedidoService pedidoService,ProductoPedidoService productoPedidoService) {
        this.userService = userService;
        this.categoriaService = categoriaService;
        this.productoService = productoService;
        this.pedidoService = pedidoService;
        this.productoPedidoService = productoPedidoService;
    }
    
    @RequestMapping("/pedir")
    public String pedir(Model model,Principal principal){
    	if(principal!=null) {
    		String email = principal.getName();
        	User user=userService.findByEmail(email);
        	model.addAttribute("user", user);
    	}
    	
    	List<Categoria> categorias=categoriaService.allCategoria();
    	model.addAttribute("categorias", categorias);
    	return "pedir.jsp";
    }
    
    @RequestMapping(value="/user/agregar/carro/{productoId}",method=RequestMethod.POST)
    public String agregarCarro(@PathVariable("productoId") Long productoId,@RequestParam("cantidad") Integer cantidad,
    		HttpSession session) {
    	ArrayList<Object[]> carro=new ArrayList<Object[]>();
    	if(session.getAttribute("carro")==null) {
    		session.setAttribute("carro", carro);
    	}else {
    		carro= (ArrayList<Object[]>) session.getAttribute("carro");
    	}
    	Producto producto=productoService.findProducto(productoId);
    	Object arr[]= {producto,cantidad};
    	carro.add(arr);
    	session.setAttribute("carro", carro);
    	return "redirect:/pedir";
    }
  
    @RequestMapping("/user/checkout")
    public String checkout(Model model,HttpSession session,Principal principal) {
    	String email = principal.getName();
    	User user=userService.findByEmail(email);
    	
    	ArrayList<Object[]> carro=new ArrayList<Object[]>();
    	if(session.getAttribute("carro")==null) {
    		session.setAttribute("carro", carro);
    	}else {
    		carro= (ArrayList<Object[]>) session.getAttribute("carro");
    	}
    	Double precioTotal=0.0;
    	for(Object[] arr:carro) {
    		Producto producto=(Producto) arr[0];
    		Integer cantidad=(Integer) arr[1];
    		precioTotal+=producto.getPrecio()*cantidad;
    	}
    	model.addAttribute("precioTotal", precioTotal);
    	model.addAttribute("carro", carro);
    	model.addAttribute("user", user);
    	return "checkout.jsp";
    }
   
	@RequestMapping(value="/user/confirmar",method=RequestMethod.POST)
    public String confirmar(Principal principal, HttpSession session,RedirectAttributes redirectAttributes) {
    	String email = principal.getName();
    	User user=userService.findByEmail(email);
    	ArrayList<Object[]> carro=new ArrayList<Object[]>();
    	if(session.getAttribute("carro")==null) {
    		session.setAttribute("carro", carro);
    	}else {
    		carro= (ArrayList<Object[]>) session.getAttribute("carro");
    	}
    	if(carro==null||carro.size()==0) {
    		return "redirect:/pedir";
    	}
    	
    	Pedido pedido=new Pedido(user);
    	Random Num_Orden = new Random();
    	int minNumber = 100000;
		int Random = Num_Orden.nextInt(minNumber) + 1;
        pedido.setNumeroOrden(Random);
    	
    	
    	//pedido.setProductoList(null);
    	pedido=pedidoService.createOrUpdatePedido(pedido);
    	
    	Double precioTotal=0.0;
    	for(Object[] arr:carro) {
    		Producto producto=(Producto) arr[0];
    		Integer cantidad=(Integer) arr[1];
    		precioTotal+=producto.getPrecio()*cantidad;
    		ProductoPedido productoPedido=new ProductoPedido(pedido,producto,cantidad, precioTotal);
    		
    		productoPedidoService.createOrUpdateProductoPedido(productoPedido);
    	}
      	
    	redirectAttributes.addFlashAttribute("pedidoId", pedido.getId());
    	redirectAttributes.addFlashAttribute("numeroOrden", pedido.getNumeroOrden());
    	return "redirect:/user/fin";
    }
    
    @RequestMapping("/user/fin")
    public String fin(Model model,HttpSession session,Principal principal) {
    	String email = principal.getName();
    	User user=userService.findByEmail(email);
 	
    	model.addAttribute("user", user);
  	
    	return "fin.jsp";
    }
    
////////////////////////Pagina pedidos //////////////////////////////////////////////
    @RequestMapping ("admin/allPedidos")
        public String showAll( Model model) {
    	List<ProductoPedido> productoPedidos=productoPedidoService.allProductoPedido();
    	    	model.addAttribute("productoPedidos", productoPedidos);

    	    	return "pedidos.jsp";
    
    }
  

}
    


