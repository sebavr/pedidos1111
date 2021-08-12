package com.codingdojo.myproyect.models;

import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="pedido")
public class Pedido {
	//------------ Id ----------------------------------
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
	//********** Atributos o Campos ********************
	//@Min(0)
	//@Size(min = 5, max = 200)
	private Integer numeroOrden;
	
	
	//------------createdAt updatedAt------------------
	@Column(updatable=false)
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date createdAt;
	
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date updatedAt;
    
	@PrePersist
	protected void onCreate(){
		this.createdAt = new Date();
	}
	@PreUpdate
	protected void onUpdate(){
		this.updatedAt = new Date();
	}
	//*************Relaciones**************************
	//Pedido
	//========= Relacion 1xN User-Pedido =========
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="user_id")  //clave foranea
	private User user;
	//Pedido
	//========= Relacion NxN Producto-Pedido =========
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(
        name = "productopedido", 
        joinColumns = @JoinColumn(name = "pedido_id"), 
        inverseJoinColumns = @JoinColumn(name = "producto_id")
	)     
	private List<Producto> productoList;	
    //---------------Constructores-------------------
	public Pedido(){
		
	}
	
	public Pedido(User user) {
		super();
		this.user = user;
	}
	
	
	public Pedido(Integer numeroOrden, User user, List<Producto> productoList) {
		super();
		this.numeroOrden = numeroOrden;
		this.user = user;
		this.productoList = productoList;
		
	}
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Integer getNumeroOrden() {
//		Random Num_Orden = new Random();
//    	int minNumber = 100000;
//		int Random = Num_Orden.nextInt(minNumber) + 1;
//        setNumeroOrden(Random);
		return this.numeroOrden;
	}
	public void setNumeroOrden(Integer numeroOrden) {
		this.numeroOrden = numeroOrden;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public List<Producto> getProductoList() {
		return productoList;
	}
	public void setProductoList(List<Producto> productoList) {
		this.productoList = productoList;
	}
//	public double getPrecioTotal() {
//		double PrecioTotal=0.0;
//		for (Producto productos : this.productoList) {
//			precioTotal += productos.getPrecio();
//		}
//
//		return precioTotal;
//		}
//
//	public void setPrecioTotal(Double precioTotal) {
//		this.precioTotal = precioTotal;
//	}
//	
//	
		
	//**********Getters Setters************************
	
}
