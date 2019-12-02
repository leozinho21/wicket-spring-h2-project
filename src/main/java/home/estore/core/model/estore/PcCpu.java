package home.estore.core.model.estore;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import home.estore.core.model.generic.EstoreItem;


@Entity
@Table(name = "EST_PC_CPU", schema="ESTORE")
public class PcCpu extends EstoreItem<PcCpu>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Column(name = "cores",nullable =false)
	private int cores = 2;
	
	@Column(name = "frequency",nullable =false)
	private String frequency = "2GHz";

	
	public PcCpu() {}
	
	public int getCores() {
		return cores;
	}


	public void setCores(int cores) {
		this.cores = cores;
	}

	public String getFrequency() {
		return frequency;
	}

	public void setFrequency(String frequency) {
		this.frequency = frequency;
	}
}
