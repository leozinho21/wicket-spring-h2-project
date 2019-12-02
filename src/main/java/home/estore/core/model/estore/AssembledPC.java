package home.estore.core.model.estore;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;


public class AssembledPC implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private PcHardDrive 	hardDrive;
	
	private PcMonitor 		monitor;
	
	private Set<PcMemory> memories = new HashSet<PcMemory>();
	
	private PcCpu			cpu;
	
	
	public AssembledPC() {}


	public PcHardDrive getHardDrive() {
		return hardDrive;
	}


	public void setHardDrive(PcHardDrive hardDrive) {
		this.hardDrive = hardDrive;
	}


	public PcMonitor getMonitor() {
		return monitor;
	}


	public void setMonitor(PcMonitor monitor) {
		this.monitor = monitor;
	}


	public Set<PcMemory> getMemories() {
		return memories;
	}


	public void setMemories(Set<PcMemory> memories) {
		this.memories = memories;
	}

	public void addMemory(PcMemory memory) {
		getMemories().add(memory);
	}
	public void removeMemory(PcMemory memory) {
		PcMemory item = getMemories().stream().filter(mem -> mem.getId()==memory.getId()).findFirst().get();
		
		if(item != null) {
			getMemories().remove(item);
		}
	}
	public PcCpu getCpu() {
		return cpu;
	}


	public void setCpu(PcCpu cpu) {
		this.cpu = cpu;
	}
	
	public double calcTotalPrice() {
		double total = 0.0;
		
		if(cpu != null) {
			total += cpu.getPrice();
		}
		if(monitor != null) {
			total += monitor.getPrice();
		}
		if(hardDrive != null) {
			total += hardDrive.getPrice();
		}
		if(memories.size() > 0) {
			
			for(PcMemory memory : memories ) {
				total += memory.getPrice();
			}
		}
		return total;
	}
}
