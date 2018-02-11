package com.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.entities.Contact;
import com.services.ContactService;

@Controller
@RequestMapping(value="contact")
public class ContactController {
	
	@Autowired
    ContactService contactService;
	
	@RequestMapping(value="/page", method = RequestMethod.GET)
	public ModelAndView getPage() {
		ModelAndView view = new ModelAndView("phonebook");
		return view;
	}
	
	@RequestMapping(value = "/saveOrUpdate", method = RequestMethod.POST)
    public @ResponseBody Map<String, Object> getSaved(Contact contact) {
        Map<String, Object> map = new HashMap<String, Object>();
       System.out.println("UPdateaaa");
       System.out.println(contact.getContactId());
        if (contactService.saveOrUpdate(contact)) {
            map.put("status", "200");
            map.put("message", "Contact have been saved successfully");
        }
 
        return map;
    }
 
    @RequestMapping(value = "/list", method = RequestMethod.POST)
    public @ResponseBody Map<String, Object> getAll(Contact contact) {
        Map<String, Object> map = new HashMap<String, Object>();
 
        List<Contact> list = contactService.list();
 
        if (list != null) {
            map.put("status", "200");
            map.put("message", "Data found");
            map.put("data", list);
        } else {
            map.put("status", "404");
            map.put("message", "Data not found");
 
        }
 
        return map;
    }
 
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public @ResponseBody Map<String, Object> delete(Contact contact) {
        Map<String, Object> map = new HashMap<String, Object>();
 
        if (contactService.delete(contact)) {
            map.put("status", "200");
            map.put("message", "Contact have been deleted successfully");
        }
 
        return map;
    }
	
}
