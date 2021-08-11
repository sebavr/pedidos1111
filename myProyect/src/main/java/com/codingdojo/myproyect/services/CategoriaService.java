package com.codingdojo.myproyect.services;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.codingdojo.myproyect.models.Categoria;
import com.codingdojo.myproyect.models.Producto;
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
	
	public List<Categoria> findByNombreNotIn(List<Categoria> categorias){
		if(categorias==null|| categorias.size()==0) {
			return categoriaRepository.findAll();
		}
		ArrayList<String> nombres=new ArrayList<String>();
		for(Categoria c:categorias) {
			nombres.add(c.getNombre());
		}
		
		return categoriaRepository.findByNombreNotIn(nombres);
	}
}