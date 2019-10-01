package pe.edu.upeu.service;

import java.util.List;
import pe.edu.upeu.model.ServPeriodo;

/**
 *
 * @author davidmp
 */
public interface ServPeriodoService {
    ServPeriodo save(ServPeriodo user);

    List<ServPeriodo> findAll();

    void delete(int id);   
}
