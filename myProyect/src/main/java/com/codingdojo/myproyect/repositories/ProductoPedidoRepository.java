package com.codingdojo.myproyect.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.myproyect.models.ProductoPedido;

@Repository
public interface ProductoPedidoRepository extends CrudRepository<ProductoPedido, Long>{
	
    List<ProductoPedido> findAll();
    
   // @Query("SELECT pp FROM ProductoPedido pp JOIN pp.pedido p WHERE p.id=?1")
    @Query("SELECT pp FROM ProductoPedido pp WHERE pp.pedido.id=?1")
    List<ProductoPedido> findProductoPedido(Long id);
}