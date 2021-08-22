package com.empresa.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.empresa.entidades.Cliente;
import com.empresa.service.ClienteService;

@Controller
public class BoletaConsultaController {


	@Autowired
	private ClienteService clienteService;
	
	@RequestMapping("/verBoletaConsulta")
	public String verBoleta() {
		return "boletaConsulta";
	}
	
	@RequestMapping("/listaCliente")
	@ResponseBody
 	public List<Cliente> listaCliente(){
		return clienteService.listaCliente(); 
	}
	
	
	
}
