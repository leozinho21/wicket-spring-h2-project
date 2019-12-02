package home.estore.core.business.repositories.shoppingcart;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.transaction.annotation.Transactional;

import home.estore.core.model.estore.PcHardDrive;

@Transactional
public interface PcHardDriveRepository extends CrudRepository<PcHardDrive, Long> {

	@Query("select c from PcHardDrive c where c.id = ?1")
	PcHardDrive findOne(Long id);
	
	@Query("select c from PcHardDrive c where c.code = ?1")
	PcHardDrive findByCode(String code);
	
}
