package com.mahendra.springhib.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.mahendra.springhib.model.Document;

@Repository
public class DocumentDAO {

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	private SessionFactory sessionFactory;

	@Transactional
	public void save(Document document) {
		Session session = sessionFactory.getCurrentSession();
		// session.save(document);
		Transaction trans = session.beginTransaction();
		session.save(document);
		trans.commit();
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public List<Document> list() {
		Session session = sessionFactory.getCurrentSession();
		List<Document> documents = null;
		try {
			Transaction trans = session.beginTransaction();
			documents = (List<Document>) session.createQuery("from Document")
					.list();
			trans.commit();

		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return documents;
	}

	@Transactional
	public Document get(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		Transaction trans = session.beginTransaction();
		Document document = (Document) session.get(Document.class, id);
		trans.commit();
		return document;

	}

	@Transactional
	public void remove(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		Transaction trans = session.beginTransaction();
		Document document = (Document) session.get(Document.class, id);
		session.delete(document);
		trans.commit();
	}
}
