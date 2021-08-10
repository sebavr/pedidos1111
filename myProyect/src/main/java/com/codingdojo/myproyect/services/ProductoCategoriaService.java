package com.codingdojo.myproyect.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.codingdojo.myproyect.models.ProductoCategoria;
import com.codingdojo.myproyect.repositories.ProductoCategoriaRepository;

@Service
public class ProductoCategoriaService {

    private final ProductoCategoriaRepository productocategoriaRepository;
    
    public ProductoCategoriaService(ProductoCategoriaRepository productocategoriaRepository) {
        this.productocategoriaRepository = productocategoriaRepository;
    }

    public List<ProductoCategoria> allProductoCategoria() {
        return productocategoriaRepository.findAll();
    }
    public ProductoCategoria findProductoCategoria(Long id) {
        Optional<ProductoCategoria> optionalProductoCategoria = productocategoriaRepository.findById(id);
        if(optionalProductoCategoria.isPresent()) {
            return optionalProductoCategoria.get();
        } else {
            return null;
        }
    }
	public ProductoCategoria createOrUpdateProductoCategoria(ProductoCategoria productocategoria) {
        return productocategoriaRepository.save(productocategoria);
    }
	public void deleteProductoCategoria(Long id) {
    	Optional<ProductoCategoria> optionalProductoCategoria = productocategoriaRepository.findById(id);
        if(optionalProductoCategoria.isPresent()) {
        	productocategoriaRepository.deleteById(id);
        } else {
            return;
        }
    }
}