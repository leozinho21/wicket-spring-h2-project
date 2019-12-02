package home.estore.core.model.generic;

import java.io.Serializable;
import java.text.Collator;
import java.util.Locale;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

@MappedSuperclass
public abstract class BaseEntity<E extends BaseEntity<?>>
		implements Serializable, Comparable<E> {

	private static final long serialVersionUID = -3988499137919577054L;
	
	/**
	* Comparing and sorting Strings is a bit tricky, and should be done with some care. 
	* This is particularly true when the text is displayed to the end user, or when working with localized text.
	* There are two fundamentally different ways of comparing strings:

	* - simple Unicode ordering - used by String
	* - localized ordering (the kind expected by an end user) - used by Collator
	
	* This causes problems, because:
	* - there are only occasional mismatches between the two styles
	* - it's easy to forget to apply the distinction, when needed
	* Commonly used String methods such as:
	* - String.equalsIgnoreCase(String)
	* - String.compareTo(String)
	* can be dangerous to use, depending on the context. The reason is that programmers tend to apply them to tasks 
	* they really aren't meant for, simply out of habit.
	* The fundamental difference is that localized comparison depends on Locale, while String is largely ignorant 
	* of Locale. 
	* Here is a quote from The Java Programming Language by Arnold, Gosling, and Holmes:
	* "You should be aware that internationalization and localization issues of full Unicode strings are not addressed 
	* with [String] methods. For example, when you're comparing two strings to determine which is 'greater', characters 
	* in strings are compared numerically by their Unicode values, not by their localized notion of order."
	* The only robust way of doing localized comparison or sorting of Strings, in the manner expected by an end user, 
	* is to use a Collator, not the methods of the String class.
	*/
	public static final Collator DEFAULT_STRING_COLLATOR = Collator.getInstance(Locale.ENGLISH);
	
	static {
		DEFAULT_STRING_COLLATOR.setStrength(Collator.PRIMARY);
	}
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	@Column(name = "descr")
	private String descr;
	
	@Column(name = "code")
	private String code;
	
	/**
	 * Indicates if the record is persisted or not
	 * 
	 */
	public boolean isNew() {
		return getId() == null;
	}

	
	@Override
	public boolean equals(Object object) {
		if (object == null) {
			return false;
		}
		if (object == this) {
			return true;
		}
		
		if (object.getClass() != this.getClass()) {
			return false;
		}

		BaseEntity<E> entity = (BaseEntity<E>) object;
		Long id = getId();

		if (id == null) {
			return false;
		}

		return id.equals(entity.getId());
	}

	@Override
	public int hashCode() {
		int hash = 7;
		
		Long id = getId();
		hash = 31 * hash + ((id == null) ? 0 : id.hashCode());

		return hash;
	}

	public int compareTo(E o) {
		if (this == o) {
			return 0;
		}
		return this.getId().compareTo(o.getId());
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Record.");
		builder.append(this.getClass().getSimpleName());
		builder.append("<");
		builder.append(getId());
		builder.append("-");
		builder.append(super.toString());
		builder.append(">");
		
		return builder.toString();
	}

	public String getDescr() {
		return descr;
	}

	public void setDescr(String descr) {
		this.descr = descr;
	}


	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}


	public String getCode() {
		return code;
	}


	public void setCode(String code) {
		this.code = code;
	}
}