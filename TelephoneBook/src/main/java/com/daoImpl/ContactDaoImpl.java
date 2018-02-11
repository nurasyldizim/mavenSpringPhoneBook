package com.daoImpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.dao.ContactDao;
import com.entities.Contact;

@Repository
@Transactional
public class ContactDaoImpl implements ContactDao {

	@Autowired
	SessionFactory session;
	public List<Contact> list() {
		List<Contact> list = session.getCurrentSession().createQuery(" from Contact ").list();
		return list;
	}

	public boolean delete(Contact contact) {
		try {
			session.getCurrentSession().delete(contact);
		}catch (Exception e) {
			return false;
		}
		return true;
	}

	public boolean saveOrUpdate(Contact contact) {
		session.getCurrentSession().saveOrUpdate(contact);
		return true;
	}

	public Contact getContact(int contactId) {
		return (Contact)session.getCurrentSession().get(Contact.class, contactId);
	}

}
