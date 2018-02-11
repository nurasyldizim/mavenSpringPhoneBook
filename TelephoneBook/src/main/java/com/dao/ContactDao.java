package com.dao;

import java.util.List;

import com.entities.Contact;

public interface ContactDao {
	public List<Contact> list();
	public boolean delete(Contact contact);
	public boolean saveOrUpdate(Contact contact);
	public Contact getContact(int contactId);
}
