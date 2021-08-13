package com.codingdojo.myproyect.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.codingdojo.myproyect.models.ProductoPedido;
import com.codingdojo.myproyect.repositories.ProductoPedidoRepository;

@Service
public class ProductoPedidoService {

    private final ProductoPedidoRepository productopedidoRepository;
    
    public ProductoPedidoService(ProductoPedidoRepository productopedidoRepository) {
        this.productopedidoRepository = productopedidoRepository;
    }

    public List<ProductoPedido> allProductoPedido() {
        return productopedidoRepository.findAll();
           }
    public List<Object[]> all(Long id) {
        return productopedidoRepository.findProductoPedido(id);
           }
    
    public ProductoPedido findProductoPedido(Long id) {
        Optional<ProductoPedido> optionalProductoPedido = productopedidoRepository.findById(id);
        if(optionalProductoPedido.isPresent()) {
            return optionalProductoPedido.get();
        } else {
            return null;
        }
    }
	public ProductoPedido createOrUpdateProductoPedido(ProductoPedido productopedido) {
        return productopedidoRepository.save(productopedido);
    }
	public void deleteProductoPedido(Long id) {
    	Optional<ProductoPedido> optionalProductoPedido = productopedidoRepository.findById(id);
        if(optionalProductoPedido.isPresent()) {
        	productopedidoRepository.deleteById(id);
        } else {
            return;
        }
    }
}