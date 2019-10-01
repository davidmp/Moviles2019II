package pe.edu.upeu.dao;


import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import pe.edu.upeu.model.AutUser;


@Repository
public interface UserDao extends CrudRepository<AutUser, Long> {
    AutUser findByUsername(String username);
}
