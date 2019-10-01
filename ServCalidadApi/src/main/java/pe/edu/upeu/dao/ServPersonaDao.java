/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.dao;



import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import pe.edu.upeu.model.ServPersona;

/**
 *
 * @author davidmp
 */
@Repository
public interface ServPersonaDao extends CrudRepository<ServPersona, Integer>{
    //ServPersona findByUsername(String nombre);
}
