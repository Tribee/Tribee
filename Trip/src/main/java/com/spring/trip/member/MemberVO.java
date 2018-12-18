package com.spring.trip.member;

public class MemberVO {
	
	//m_idx, id, name, nick_name, password -> not null
	//m_idx, nick_name -> 중복x
	
	private int m_idx, age, point;
	private String id, name, nick_name, password, address, job, gender, utopia, introduce, rank, email, profileImagePath; //profileImagePath 추가
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getM_idx() {
		return m_idx;
	}
	public String getProfileImagePath() {
		return profileImagePath;
	}
	public void setProfileImagePath(String profileImagePath) {
		this.profileImagePath = profileImagePath;
	}
	public void setM_idx(int m_idx) {
		this.m_idx = m_idx;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNick_name() {
		return nick_name;
	}
	public void setNick_name(String nick_name) {
		this.nick_name = nick_name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getUtopia() {
		return utopia;
	}
	public void setUtopia(String utopia) {
		this.utopia = utopia;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public String getRank() {
		return rank;
	}
	public void setRank(String rank) {
		this.rank = rank;
	}
	@Override
	public String toString() {
		return "MemberVO [m_idx=" + m_idx + ", age=" + age + ", point=" + point + ", id=" + id + ", name=" + name
				+ ", nick_name=" + nick_name + ", password=" + password + ", address=" + address + ", job=" + job
				+ ", gender=" + gender + ", utopia=" + utopia + ", introduce=" + introduce + ", rank=" + rank
				+ ", email=" + email + ", profileImagePath=" + profileImagePath + "]";
	}



}
