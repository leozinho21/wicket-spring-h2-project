package home.estore.core.business.repositories.shoppingcart;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.transaction.annotation.Transactional;

import home.estore.core.model.estore.PcCpu;

@Transactional
public interface PcCpuRepository extends CrudRepository<PcCpu, Long> {

	@Query("select c from PcCpu c where c.id = ?1")
	PcCpu findOne(Long id);
	
	@Query("select c from PcCpu c where c.code = ?1")
	PcCpu findByCode(String code);
	
}
