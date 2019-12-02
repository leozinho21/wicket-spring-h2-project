package home.estore.core.model.generic;

import javax.persistence.MappedSuperclass;

@MappedSuperclass
public abstract class EstoreItem<E extends EstoreItem<?>> extends BaseEntity<E>{

	private static final long serialVersionUID = 1L;
	
	private Double price;
	private String image;
	
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
}
