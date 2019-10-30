package pe.edu.upeu.dao;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import pe.edu.upeu.model.ServCategoriaCliente;

@Repository
public interface ServCategoriaClienteDao extends CrudRepository<ServCategoriaCliente, Integer> {

}