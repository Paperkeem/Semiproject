package data.Dto;

import java.sql.Timestamp;

public class cartorderDto {
	private String orderid;
	private String name;
	private String num;
	private String addr1;
	private String addr2;
	private String state;
	private String delivery;
	private Timestamp orderdate;
	
	
	public String getOrderid() {
		return orderid;
	}
	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getDelivery() {
		return delivery;
	}
	public void setDelivery(String delivery) {
		this.delivery = delivery;
	}
	public Timestamp getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(Timestamp orderdate) {
		this.orderdate = orderdate;
	}
	
	
}
