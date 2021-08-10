package com.codingdojo.myproyect.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.codingdojo.myproyect.models.Producto;
import com.codingdojo.myproyect.repositories.ProductoRepository;

@Service
public class ProductoService {

    private final ProductoRepository productoRepository;
    
    public ProductoService(ProductoRepository productoRepository) {
        this.productoRepository = productoRepository;
    }

    public List<Producto> allProducto() {
        return productoRepository.findAll();
    }
    public Producto findProducto(Long id) {
        Optional<Producto> optionalProducto = productoRepository.findById(id);
        if(optionalProducto.isPresent()) {
            return optionalProducto.get();
        } else {
            return null;
        }
    }
	public Producto createOrUpdateProducto(Producto producto) {
        return productoRepository.save(producto);
    }
	public void deleteProducto(Long id) {
    	Optional<Producto> optionalProducto = productoRepository.findById(id);
        if(optionalProducto.isPresent()) {
        	productoRepository.deleteById(id);
        } else {
            return;
        }
    }
}