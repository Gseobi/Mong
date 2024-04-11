package kr.co.mong.bean;

import org.springframework.stereotype.Component;

@Component
public class AccountBean {

	private String id;
	private String pw;

	private boolean login;

	public AccountBean() {
		login = false;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public boolean isLogin() {
		return login;
	}

	public void setLogin(boolean login) {
		this.login = login;
	}

}
