package home.estore.core.model.estore;

import javax.persistence.Entity;
import javax.persistence.Table;

import home.estore.core.model.generic.EstoreItem;


@Entity
@Table(name = "EST_PC_HARD_DRIVE", schema="ESTORE")
public class PcHardDrive extends EstoreItem<PcHardDrive>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	

}
