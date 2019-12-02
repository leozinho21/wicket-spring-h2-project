package home.estore.core.business.repositories.shoppingcart;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.transaction.annotation.Transactional;

import home.estore.core.model.estore.PcCpu;
import home.estore.core.model.estore.User;

@Transactional
public interface UserRepository extends CrudRepository<User, Long> {

	@Query("select c from User c where c.id = ?1")
	User findOne(Long id);
	
	@Query("select c from User c where c.password = ?1")
	User findByPassword(String password);
	
	@Query("select c from User c where c.username = ?1 and c.password = ?2")
	User find(String username,String password);
	
}
