/**
 * 
 */
package home.estore.core.model.shoppingcart;

import java.io.Serializable;

import home.estore.core.model.estore.AssembledPC;
import home.estore.msoffice.Msoffice;


public class ShoppingCart implements Serializable{

	
	private static final long serialVersionUID = 1L;
	
	private int orderNum;

	private AssembledPC assembledPC;
	private Msoffice 	microsoftService;
	
	public int getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}
	
	public double getAmountTotal() {
		double total = 0;
		
		if(microsoftService != null) {
			total += microsoftService.getPrice();
		}
		
		if(assembledPC != null) {
			total += assembledPC.calcTotalPrice();
		}
		
		return total;
	}

	public AssembledPC getAssembledPC() {
		return assembledPC;
	}

	public void setAssembledPC(AssembledPC assembledPC) {
		this.assembledPC = assembledPC;
	}

	public Msoffice getMicrosoftService() {
		return microsoftService;
	}

	public void setMicrosoftService(Msoffice microsoftService) {
		this.microsoftService = microsoftService;
	}

}
