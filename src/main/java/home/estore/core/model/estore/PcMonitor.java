package home.estore.core.model.estore;

import javax.persistence.Entity;
import javax.persistence.Table;

import home.estore.core.model.generic.EstoreItem;


@Entity
@Table(name = "EST_PC_MONITOR", schema="ESTORE")
public class PcMonitor extends EstoreItem<PcMonitor>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	

}
