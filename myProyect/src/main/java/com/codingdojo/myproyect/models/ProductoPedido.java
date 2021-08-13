package com.codingdojo.myproyect.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="productopedido")
public class ProductoPedido {
	//------------ Id ----------------------------------
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
	//********** Atributos o Campos ********************
	//@Min(0)
	//@Size(min = 5, max = 200)
	private Integer cantidad;
    private Double precioTotal;
	private String instrucciones;
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
	//ProductoPedido
	//========= Relacion Producto-Pedido (Tabla Intermedia)=========
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="producto_id")
	private Producto producto;
    
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="pedido_id")
	private Pedido pedido;
	

	
    //---------------Constructores-------------------
	public ProductoPedido(){
		
	}
	

	public ProductoPedido(Pedido pedido,Producto producto,Integer cantidad, Double precioTotal) { //, Double precioTotal{
	
		this.cantidad = cantidad;
		this.producto = producto;
		this.pedido = pedido;
		this.precioTotal=precioTotal;
		
	}
	
	public ProductoPedido(Integer cantidad, Double precioTotal, String instrucciones, Producto producto,
			Pedido pedido) {
		super();
		this.cantidad = cantidad;
		this.precioTotal = precioTotal;
		this.instrucciones = instrucciones;
		this.producto = producto;
		this.pedido = pedido;
	}
	public String getInstrucciones() {
		return instrucciones;
	}
	public void setInstrucciones(String instrucciones) {
		this.instrucciones = instrucciones;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}

	public Integer getCantidad() {
		return cantidad;
	}
	public void setCantidad(Integer cantidad) {
		this.cantidad = cantidad;
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
	public Producto getProducto() {
		return producto;
	}
	public void setProducto(Producto producto) {
		this.producto = producto;
	}
	public Pedido getPedido() {
		return pedido;
	}
	public void setPedido(Pedido pedido) {
		this.pedido = pedido;
	}

//	//metodo
  public Double getPrecioTotal(){
	return precioTotal;
	}
	public void setPrecioTotal(Double precioTotal) {
		this.precioTotal = precioTotal;
	}

	
	//**********Getters Setters************************
	
}
