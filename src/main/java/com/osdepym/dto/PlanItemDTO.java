    
package com.osdepym.dto;

import java.util.List;

public class PlanItemDTO implements Comparable<PlanItemDTO> {
	private Long id;
	private String title;
	private String value;
	private List<PlanItemDTO> subitemsList;
	private PlanItemDTO itemPadre;
	
	public PlanItemDTO() {}
	
	public PlanItemDTO(Long id, String title, String value, List<PlanItemDTO> subitemsList, PlanItemDTO itemPadre){
		this.id = id;
		this.title = title;
		this.value = value;
		this.subitemsList = subitemsList;
		this.itemPadre = itemPadre;
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public List<PlanItemDTO> getSubitemsList() {
		return subitemsList;
	}
	public void setSubitemsList(List<PlanItemDTO> subitemsList) {
		this.subitemsList = subitemsList;
	}
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	
	public PlanItemDTO getItemPadre() {
		return itemPadre;
	}
	public void setItemPadre(PlanItemDTO itemPadre) {
		this.itemPadre = itemPadre;
	}
	
	@Override
    public int compareTo(PlanItemDTO dto) {
        return Long.compare(this.id,dto.id);
    }

    @Override
    public String toString() {
    	if(itemPadre == null) 
    		return "Item: [id=" + id + ", title=" + title + ", value=" + value + "]";
    	else
    		return "Subitem: [id=" + id + ", title=" + title + ", value=" + value + "]";
    }
}