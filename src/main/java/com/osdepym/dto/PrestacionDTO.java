package com.osdepym.dto;

import java.util.HashSet;
import java.util.Set;

import com.osdepym.hibernate.entity.EspecialidadPrestacion;

public class PrestacionDTO {

	private Long idPrestacion;
	
	private String etiqueta;

	private Set<EspecialidadPrestacion> especialidadPrestacion = new HashSet<EspecialidadPrestacion>();

	public PrestacionDTO(Long idPrestacion, String etiqueta) {
		this.idPrestacion = idPrestacion;
		this.etiqueta = etiqueta;
	}
	
	public PrestacionDTO() {}
	
	public Long getIdPrestacion() {
		return idPrestacion;
	}

	public void setIdPrestacion(Long idPrestacion) {
		this.idPrestacion = idPrestacion;
	}

	public String getEtiqueta() {
		return etiqueta;
	}

	public void setEtiqueta(String etiqueta) {
		this.etiqueta = etiqueta;
	}

	public Set<EspecialidadPrestacion> getEspecialidadPrestacion() {
		return especialidadPrestacion;
	}

	public void setEspecialidadPrestacion(Set<EspecialidadPrestacion> especialidadPrestacion) {
		this.especialidadPrestacion = especialidadPrestacion;
	}

	
}
