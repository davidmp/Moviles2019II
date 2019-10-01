package pe.edu.upeu.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import pe.edu.upeu.dao.ServPeriodoDao;
import pe.edu.upeu.dao.UserDao;
import pe.edu.upeu.model.AutUser;
import pe.edu.upeu.model.ServPeriodo;

/**
 *
 * @author davidmp
 */
@Service //UserDetailsService
public class ServPeriodoServiceImpl implements ServPeriodoService {
    
    @Autowired
    private ServPeriodoDao dao;
    @Autowired
    private UserDao userDao;    
    
   /* @Override
    public UserDetails loadUserByUsername(String userId) throws UsernameNotFoundException {
        AutUser user = userDao.findByUsername(userId);
        if (user == null) {
            throw new UsernameNotFoundException("Invalid username or password.");
        }
        return new org.springframework.security.core.userdetails.User(String.valueOf(user.getId()), user.getPassword(), getAuthority());
    }

    private List<SimpleGrantedAuthority> getAuthority() {
        return Arrays.asList(new SimpleGrantedAuthority("ROLE_ADMIN"));
    }   */ 
    
    @Override
    public ServPeriodo save(ServPeriodo user) {
        return dao.save(user);
    }

    @Override
    public List<ServPeriodo> findAll() {
        List<ServPeriodo> list = new ArrayList<>();
        dao.findAll().iterator().forEachRemaining(list::add);
        return list;
    }

    @Override
    public void delete(int id) {
        dao.deleteById(id);
    }
    
}