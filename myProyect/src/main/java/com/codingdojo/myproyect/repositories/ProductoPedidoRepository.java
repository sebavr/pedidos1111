package com.codingdojo.myproyect.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.myproyect.models.ProductoPedido;

@Repository
public interface ProductoPedidoRepository extends CrudRepository<ProductoPedido, Long>{
    List<ProductoPedido> findAll();
}