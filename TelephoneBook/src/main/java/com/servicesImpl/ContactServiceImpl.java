package com.servicesImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.ContactDao;
import com.entities.Contact;
import com.services.ContactService;

@Service
public class ContactServiceImpl implements ContactService {

	@Autowired
	ContactDao contactDao;
	
	public List<Contact> list() {
		return contactDao.list();
	}

	public boolean delete(Contact contact) {
		return contactDao.delete(contact);
	}

	public boolean saveOrUpdate(Contact contact) {
		return contactDao.saveOrUpdate(contact);
	}

	public Contact getContact(int contactId) {
		return contactDao.getContact(contactId);
	}

}
