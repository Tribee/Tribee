package com.spring.trip.board;

import org.springframework.web.multipart.MultipartFile;

public class BoardVO {
	private int bb_idx, hit, l_idx, good, bad;
	private String id, title, content, regdate, start_date, end_date, place, nick_name, country, address;
	private float latitude, longitude;
	
	private MultipartFile uploadFile;
	
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	public int getBb_idx() {
		return bb_idx;
	}
	public void setBb_idx(int bb_idx) {
		this.bb_idx = bb_idx;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public int getL_idx() {
		return l_idx;
	}
	public void setL_idx(int l_idx) {
		this.l_idx = l_idx;
	}
	public int getGood() {
		return good;
	}
	public void setGood(int good) {
		this.good = good;
	}
	public int getBad() {
		return bad;
	}
	public void setBad(int bad) {
		this.bad = bad;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public String getNick_name() {
		return nick_name;
	}
	public void setNick_name(String nick_name) {
		this.nick_name = nick_name;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public float getLatitude() {
		return latitude;
	}
	public void setLatitude(float latitude) {
		this.latitude = latitude;
	}
	public float getLongitude() {
		return longitude;
	}
	public void setLongitude(float longitude) {
		this.longitude = longitude;
	}
	@Override
	public String toString() {
		return "BoardVO [bb_idx=" + bb_idx + ", hit=" + hit + ", l_idx=" + l_idx + ", good=" + good + ", bad=" + bad
				+ ", id=" + id + ", title=" + title + ", content=" + content + ", regdate=" + regdate + ", start_date="
				+ start_date + ", end_date=" + end_date + ", place=" + place + ", nick_name=" + nick_name + ", country="
				+ country + ", address=" + address + ", latitude=" + latitude + ", longitude=" + longitude + "]";
	}
	
	
	
	

}
