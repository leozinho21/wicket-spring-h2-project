package home.estore.core.business.repositories.shoppingcart;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.transaction.annotation.Transactional;

import home.estore.core.model.estore.PcMonitor;

@Transactional
public interface PcMonitorRepository extends CrudRepository<PcMonitor, Long> {

	@Query("select c from PcMonitor c where c.id = ?1")
	PcMonitor findOne(Long id);
	
	@Query("select c from PcMonitor c where c.code = ?1")
	PcMonitor findByCode(String code);
	
}
