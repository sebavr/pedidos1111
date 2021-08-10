package com.codingdojo.myproyect.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.myproyect.models.Producto;

@Repository
public interface ProductoRepository extends CrudRepository<Producto, Long>{
    List<Producto> findAll();
}