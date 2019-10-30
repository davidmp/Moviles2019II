package pe.edu.upeu.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import pe.edu.upeu.model.ServCategoriaCliente;
import pe.edu.upeu.service.ServCategoriaClienteService;

/**
 *
 * @author davidmp
 */
@RestController
@RequestMapping("/catcli")
public class ServCategoriaClienteController {
    @Autowired
    private ServCategoriaClienteService clienteService;

    @RequestMapping(value = "/listCatCli", method = RequestMethod.GET)
    public List<ServCategoriaCliente> listUser() {
        return clienteService.findAll();
    }

    @RequestMapping(value = "/catcli", method = RequestMethod.POST)
    public ServCategoriaCliente create(@RequestBody ServCategoriaCliente user) {
        return clienteService.save(user);
    }

    @RequestMapping(value = "/catcli/{id}", method = RequestMethod.DELETE)
    public String delete(@PathVariable(value = "id") int id) {
        clienteService.delete(id);
        return "success";
    }
}