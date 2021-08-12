package com.codingdojo.myproyect.repositories;

import java.util.List;
import java.util.Random;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.myproyect.models.Pedido;

@Repository
public interface PedidoRepository extends CrudRepository<Pedido, Long>{


	
    List<Pedido> findAll();

	Pedido save(Random num_Orden);
}