package home.estore.core.model.estore;

import java.io.Serializable;

//
//@Entity
//@Table(name = "EST_PC_MEMORY_ITEM_ASSOC", schema="ESTORE")
public class PcMemoryItemAssoc implements Serializable{// extends EstoreItem<PcMemoryItemAssoc>{

	private static final long serialVersionUID = 1L;
	
	private AssembledPC pc;
	private PcMemory 	memory;
	
	public AssembledPC getPc() {
		return pc;
	}
	public void setPc(AssembledPC pc) {
		this.pc = pc;
	}
	public PcMemory getMemory() {
		return memory;
	}
	public void setMemory(PcMemory memory) {
		this.memory = memory;
	}
}
