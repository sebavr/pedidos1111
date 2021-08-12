package com.codingdojo.myproyect.services;

import java.util.List;
import java.util.Optional;
import java.util.Random;

import org.springframework.stereotype.Service;

import com.codingdojo.myproyect.models.Pedido;
import com.codingdojo.myproyect.repositories.PedidoRepository;

@Service
public class PedidoService {

    private final PedidoRepository pedidoRepository;
    
    public PedidoService(PedidoRepository pedidoRepository) {
        this.pedidoRepository = pedidoRepository;
    }

    public List<Pedido> allPedido() {
        return pedidoRepository.findAll();
    }
    public Pedido findPedido(Long id) {
        Optional<Pedido> optionalPedido = pedidoRepository.findById(id);
        if(optionalPedido.isPresent()) {
            return optionalPedido.get();
        } else {
            return null;
        }
    }

    
	public Pedido createOrUpdatePedido(Pedido pedido) {
        return pedidoRepository.save(pedido);
    }
	
	public void deletePedido(Long id) {
    	Optional<Pedido> optionalPedido = pedidoRepository.findById(id);
        if(optionalPedido.isPresent()) {
        	pedidoRepository.deleteById(id);
        } else {
            return;
        }
	}
		

}


   
	