package com.gura.spring04;

import java.util.List;

import javax.xml.bind.annotation.XmlRootElement;

import com.sun.xml.internal.txw2.annotation.XmlElement;

@XmlRootElement(name="hobby-list")
public class HobbyList {
	private List<String> hobby;
	
	@XmlElement
	public void setHobby(List<String> hobby) {
		this.hobby = hobby;
	}
	
	public List<String> getHobby() {
		return hobby;
	}
}
