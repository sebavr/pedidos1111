package com.codingdojo.myproyect.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.myproyect.models.ProductoCategoria;

@Repository
public interface ProductoCategoriaRepository extends CrudRepository<ProductoCategoria, Long>{
    List<ProductoCategoria> findAll();
}