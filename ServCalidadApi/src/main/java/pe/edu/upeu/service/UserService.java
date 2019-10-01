package pe.edu.upeu.service;

import pe.edu.upeu.model.AutUser;

import java.util.List;

public interface UserService {

    AutUser save(AutUser user);

    List<AutUser> findAll();

    void delete(long id);
}
