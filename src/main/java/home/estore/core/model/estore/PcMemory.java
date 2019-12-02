package home.estore.core.model.estore;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import home.estore.core.model.generic.EstoreItem;


@Entity
@Table(name = "EST_PC_MEMORY", schema="ESTORE")
public class PcMemory extends EstoreItem<PcMemory>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Column(name = "memory_type")
	private MemoryTypeEnum memoryType = MemoryTypeEnum.RAM;
	
	@Column(name = "quantity")
	private Integer quantity = 1;
	
	public MemoryTypeEnum getMemoryType() {
		return memoryType;
	}

	public void setMemoryType(MemoryTypeEnum memoryType) {
		this.memoryType = memoryType;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	@Override
	public Double getPrice() {
		
		if(this.quantity == null)
			return super.getPrice();
		return this.quantity * super.getPrice();
	}
}
