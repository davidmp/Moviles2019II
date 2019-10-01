package pe.edu.upeu.dao;


import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import pe.edu.upeu.model.ServPeriodo;


@Repository
public interface ServPeriodoDao extends CrudRepository<ServPeriodo, Integer> {
    
}