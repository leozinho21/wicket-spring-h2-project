package home.estore.core.business.repositories.shoppingcart;

import org.springframework.data.repository.CrudRepository;
import org.springframework.transaction.annotation.Transactional;

import home.estore.core.model.estore.PortalUser;

@Transactional
public interface PortalUserRepository extends CrudRepository<PortalUser, Long> {

}
