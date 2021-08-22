package com.empresa.service;

import java.util.Optional;

import com.empresa.entidades.Boleta;

public interface BoletaService {

	public abstract Boleta insertaBoleta(Boleta obj);
	public abstract Optional<Boleta> listaBoletaPorId(int idBoleta);

}
