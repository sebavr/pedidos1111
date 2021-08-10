package com.codingdojo.myproyect.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.codingdojo.myproyect.models.Categoria;
import com.codingdojo.myproyect.repositories.CategoriaRepository;

@Service
public class CategoriaService {

    private final CategoriaRepository categoriaRepository;
    
    public CategoriaService(CategoriaRepository categoriaRepository) {
        this.categoriaRepository = categoriaRepository;
    }

    public List<Categoria> allCategoria() {
        return categoriaRepository.findAll();
    }
    public Categoria findCategoria(Long id) {
        Optional<Categoria> optionalCategoria = categoriaRepository.findById(id);
        if(optionalCategoria.isPresent()) {
            return optionalCategoria.get();
        } else {
            return null;
        }
    }
	public Categoria createOrUpdateCategoria(Categoria categoria) {
        return categoriaRepository.save(categoria);
    }
	public void deleteCategoria(Long id) {
    	Optional<Categoria> optionalCategoria = categoriaRepository.findById(id);
        if(optionalCategoria.isPresent()) {
        	categoriaRepository.deleteById(id);
        } else {
            return;
        }
    }
}