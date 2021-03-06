package com.osdepym.hibernate.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.osdepym.exception.CustomException;
import com.osdepym.exception.ErrorMessages;
import com.osdepym.hibernate.entity.AutorizacionDoc;

@Repository
public class AutorizacionDocDAOImpl implements AutorizacionDocDAO{

	@Autowired
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Override
	public AutorizacionDoc get(Long id) throws CustomException {
		return null;
	}

	@Override
	public List<AutorizacionDoc> getAll() throws CustomException {
		return null;
	}

	@Override
	public void save(AutorizacionDoc t) throws CustomException {}

	@Override
	public void update(AutorizacionDoc t) throws CustomException {}

	@Override
	public void delete(AutorizacionDoc t) throws CustomException {}

	@Override
	public List<String> getDocumentosByIdEspecialidadYIdPrestacion(Long idEspecialidad, Long idPrestacion) throws CustomException {
		try {
			List<String> documentos = new ArrayList<String>();
			Session session = this.sessionFactory.getCurrentSession();
			String sqlString = "SELECT DC.ID_AUTORIZACION_DOC, DC.ID_ESPEC_PREST, DC.DOCUMENTACION FROM tramites_online.AUTORIZACIONES_DOC DC INNER JOIN tramites_online.ESPEC_PREST EP ON EP.ID_ESPEC_PREST = DC.ID_ESPEC_PREST WHERE EP.ID_ESPECIALIDAD = " + idEspecialidad + " AND EP.ID_PRESTACION = " + idPrestacion;
			List<AutorizacionDoc> autorizacionDocList = session.createNativeQuery(sqlString, AutorizacionDoc.class).getResultList();
			for(AutorizacionDoc element : autorizacionDocList) {
				documentos.add(element.getDocumentacion());
			}
			return documentos;
		} catch (Exception e) {
			throw new CustomException(e.getMessage(), ErrorMessages.DATABASE_GET_ERROR);
		}
	}
}
