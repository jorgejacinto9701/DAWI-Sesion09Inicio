package com.empresa.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.empresa.entidades.ProductoHasBoleta;

public interface ProductoHasBoletaRepository extends JpaRepository<ProductoHasBoleta, Integer> {

	@Modifying
	@Query("update Producto x set x.stock = x.stock - :can where x.idProducto = :pro")
	public abstract void actualizaStock(@Param("can")int cantidad, @Param("pro")int idProducto);
	
		
}
