package com.services;

import java.util.List;

import com.entities.Contact;

public interface ContactService {

	public List<Contact> list();
	public boolean delete(Contact contact);
	public boolean saveOrUpdate(Contact contact);
	public Contact getContact(int contactId);
}
