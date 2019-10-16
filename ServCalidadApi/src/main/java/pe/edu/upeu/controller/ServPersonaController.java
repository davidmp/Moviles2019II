/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import pe.edu.upeu.model.ServPersona;
import pe.edu.upeu.service.ServPersonaService;

/**
 *
 * @author davidmp
 */
@RestController
@RequestMapping("/usersx")
public class ServPersonaController {
     @Autowired
    private ServPersonaService personaService;   
     
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public List<ServPersona> listUser() {
        return personaService.findAll();
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ServPersona login(String user, String passw) {
        return personaService.login(user, passw);
    }    

    @RequestMapping(value = "/pers", method = RequestMethod.POST)
    public ServPersona create(@RequestBody ServPersona user) {
        return personaService.save(user);
    }

    @RequestMapping(value = "/pers/{id}", method = RequestMethod.DELETE)
    public String delete(@PathVariable(value = "id") int id) {
        personaService.delete(id);
        return "success";
    }     
}
