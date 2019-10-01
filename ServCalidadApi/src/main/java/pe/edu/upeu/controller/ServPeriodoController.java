package pe.edu.upeu.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import pe.edu.upeu.model.ServPeriodo;
import pe.edu.upeu.service.ServPeriodoService;

/**
 *
 * @author davidmp
 */
@RestController
@RequestMapping("/perio")
public class ServPeriodoController {
     @Autowired
    private ServPeriodoService periodoService;   
     
    @RequestMapping(value = "/listPeriodo", method = RequestMethod.GET)
    public List<ServPeriodo> listUser() {
        return periodoService.findAll();
    }

    @RequestMapping(value = "/periodo", method = RequestMethod.POST)
    public ServPeriodo create(@RequestBody ServPeriodo user) {
        return periodoService.save(user);
    }

    @RequestMapping(value = "/periodo/{id}", method = RequestMethod.DELETE)
    public String delete(@PathVariable(value = "id") int id) {
        periodoService.delete(id);
        return "success";
    }     
}