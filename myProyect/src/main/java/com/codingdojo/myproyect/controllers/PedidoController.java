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
    		@RequestParam("instrucciones") String instrucciones,HttpSession session) {
    	ArrayList<Object[]> carro=new ArrayList<Object[]>();
    	if(session.getAttribute("carro")==null) {
    		session.setAttribute("carro", carro);
    	}else {
    		carro= (ArrayList<Object[]>) session.getAttribute("carro");
    	}
    	Producto producto=productoService.findProducto(productoId);
    	Object arr[]= {producto,cantidad,instrucciones};
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
    	//Verificar Stock disponible para cada producto en el carro
    	ArrayList<String> prodsNoStock=new ArrayList<String>();
    	for(Object[] arr:carro) {
    		Producto producto=(Producto) arr[0];
    		Integer cantidad=(Integer) arr[1];
    		if(producto.getStock()-cantidad<0) {
    			prodsNoStock.add(producto.getNombre()+" Disponible: "+producto.getStock()+" Solicitado: "+cantidad);
    		}
    	}
    	if(prodsNoStock.size()!=0) {
    		carro.clear();
    		redirectAttributes.addFlashAttribute("prodsNoStock", prodsNoStock);
        	return "redirect:/user/fin";
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
    		String instrucciones=(String) arr[2];
    		producto.setStock(producto.getStock()-cantidad);   		
    		precioTotal+=producto.getPrecio()*cantidad;
    		productoService.createOrUpdateProducto(producto);
    		
    		//ProductoPedido productoPedido=new ProductoPedido(pedido,producto,cantidad, precioTotal);
    		ProductoPedido productoPedido=new ProductoPedido(cantidad, precioTotal, instrucciones, producto,pedido);

    		productoPedidoService.createOrUpdateProductoPedido(productoPedido);
    	}
      	pedido.setPrecioTotal(precioTotal);
      	pedido=pedidoService.createOrUpdatePedido(pedido);
    	redirectAttributes.addFlashAttribute("numeroOrden", pedido.getNumeroOrden());

    	carro.clear();
    	return "redirect:/user/fin";
    }
    
    @RequestMapping("/user/fin")
    public String fin(Model model,HttpSession session,Principal principal) {
    	String email = principal.getName();
    	User user=userService.findByEmail(email);
 	
    	model.addAttribute("user", user);
  	
    	return "fin.jsp";
    }

    

    @RequestMapping(value="/user/eliminar/carro/{productoId}",method=RequestMethod.GET)
    public String eliminarCarro(@PathVariable("productoId") Long productoId,
    		HttpSession session) {
    	ArrayList<Object[]> carro=new ArrayList<Object[]>();
    	if(session.getAttribute("carro")==null) {
    		session.setAttribute("carro", carro);
    	}else {
    		carro= (ArrayList<Object[]>) session.getAttribute("carro");
    	}
    	
    	int index=0;
    	for(Object[] arr:carro) {
    		Producto producto=(Producto) arr[0];
    		if(productoId==producto.getId()) {
    			carro.remove(index);
    			break;
    		}
    		index+=1;
    	}
    	
    	session.setAttribute("carro", carro);
    	return "redirect:/user/checkout";
    }
    @RequestMapping(value="/user/editar/carro/{productoId}/{step}",method=RequestMethod.GET)
    public String editarCarro(@PathVariable("productoId") Long productoId,@PathVariable("step") Integer step,
    		HttpSession session) {
    	ArrayList<Object[]> carro=new ArrayList<Object[]>();
    	if(session.getAttribute("carro")==null) {
    		session.setAttribute("carro", carro);
    	}else {
    		carro= (ArrayList<Object[]>) session.getAttribute("carro");
    	}
    	
    	ArrayList<Object[]> newCarro=new ArrayList<Object[]>();
    	for(Object[] arr:carro) {
    		Producto producto=(Producto) arr[0];
    		Integer cantidad=(Integer) arr[1];
    		String instrucciones=(String) arr[2];
    		if(productoId==producto.getId()) {
    			Integer newCantidad=cantidad+step;
    			if(newCantidad<1) {
    				newCantidad=1;
    			}
    			Object arrTemp[]= {producto,newCantidad,instrucciones};
    			newCarro.add(arrTemp);
    		}else {
    			newCarro.add(arr);
    		}
    	}
    	
    	session.setAttribute("carro", newCarro);
    	return "redirect:/user/checkout";
    }
    


    
////////////////////////Pagina pedidos ADMIN //////////////////////////////////////////////
	@RequestMapping ("admin/allPedidos")
	public String showAll( Model model) {
    List<Pedido> pedidos=pedidoService.allPedido();
	model.addAttribute("pedidos", pedidos);
	
	return "pedidos.jsp";
	}

	
	
	@RequestMapping ("admin/pedido/{pedidoId}")
	public String showPedido (@PathVariable("pedidoId") Long id, Model model) {
		
		Pedido pedido=pedidoService.findPedido(id);	
		List<ProductoPedido> productoPedidos=productoPedidoService.getProductoPedido(pedido.getId());
				
		model.addAttribute("pedido", pedido);
		model.addAttribute("productoPedidos", productoPedidos);
		return "pedidoID.jsp";
	}
	
}

