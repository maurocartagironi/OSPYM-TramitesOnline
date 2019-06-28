package com.osdepym.dto;

import java.util.List;

public class PlanSeccionDTO implements Comparable<PlanSeccionDTO> {
	private Long id;
	private String title;
	private String subtitle;
	private List<PlanItemDTO> itemsList;
	
	public PlanSeccionDTO(Long id, String title, String subtitle, List<PlanItemDTO> list) {
		this.id = id;
		this.title = title;
		this.subtitle = subtitle;
		this.itemsList = list;
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSubtitle() {
		return subtitle;
	}
	public void setSubtitle(String subtitle) {
		this.subtitle = subtitle;
	}
	public List<PlanItemDTO> getItemsList() {
		return itemsList;
	}
	public void setItemsList(List<PlanItemDTO> itemsList) {
		this.itemsList = itemsList;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	
	@Override
    public int compareTo(PlanSeccionDTO dto) {
        return Long.compare(this.id,dto.id);
    }

    @Override
    public String toString() {
        return "Seccion: [id=" + id + ", title=" + title + ", subtitle=" + subtitle + "]";
    }
}