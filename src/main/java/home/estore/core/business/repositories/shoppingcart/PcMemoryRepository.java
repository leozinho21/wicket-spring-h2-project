package home.estore.core.business.repositories.shoppingcart;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.transaction.annotation.Transactional;

import home.estore.core.model.estore.PcMemory;

@Transactional
public interface PcMemoryRepository extends CrudRepository<PcMemory, Long> {

//	@Query("select c from PcMemory c where c.id = ?1")
//	PcMemory findOne(Long id);
	
	@Query("select c from PcMemory c where c.code = ?1")
	PcMemory findByCode(String code);
}
