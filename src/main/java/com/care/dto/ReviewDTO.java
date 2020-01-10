package com.care.dto;

public class ReviewDTO {
	//product 테이블
	private String modelName; //모델네임
	private String cpu; //cpu
	private String ram;//램
	private String storage;//ssd 용량
	private String display; //화면크기
	public String getRam() {
		return ram;
	}

	private String weight; //무게
	private String purpose; //용도
	
		
	public String getModelName() {
		return modelName;
	}
	public void setModelName(String modelName) {
		this.modelName = modelName;
	}
	public String getCpu() {
		return cpu;
	}
	public void setCpu(String cpu) {
		this.cpu = cpu;
	}
	/*램, 용량 추가*/
	public void setRam(String ram) {
		this.ram = ram;
	}
	public String getStorage() {
		return storage;
	}
	public void setStorage(String storage) {
		this.storage = storage;
	}

	public String getDisplay() {
		return display;
	}
	public void setDisplay(String display) {
		this.display = display;
	}
	public String getWeight() {
		return weight;
	}
	public void setWeight(String weight) {
		this.weight = weight;
	}
	public String getPurpose() {
		return purpose;
	}
	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}
	
}
