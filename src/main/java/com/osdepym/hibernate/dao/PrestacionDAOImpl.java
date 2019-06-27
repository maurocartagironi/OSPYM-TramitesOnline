package com.osdepym.hibernate.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.osdepym.exception.CustomException;
import com.osdepym.hibernate.entity.Prestacion;


@Repository
public class PrestacionDAOImpl implements PrestacionDAO{

	@Override
	public Prestacion get(Long id) throws CustomException {
		return null;
	}

	@Override
	public List<Prestacion> getAll() throws CustomException {
		return null;
	}

	@Override
	public void save(Prestacion t) throws CustomException {}

	@Override
	public void update(Prestacion t) throws CustomException {}

	@Override
	public void delete(Prestacion t) throws CustomException {}
}
