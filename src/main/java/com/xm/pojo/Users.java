package com.xm.pojo;

import java.io.Serializable;
import java.util.List;

public class Users implements Serializable {
	private static final long serialVersionUID = 1L;

	private Integer id;

    private String email;

    private String username;

    private String password;

    private String phonenum;

    private Integer status;
    
    private List<Role> roles;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getPhonenum() {
        return phonenum;
    }

    public void setPhonenum(String phonenum) {
        this.phonenum = phonenum == null ? null : phonenum.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
    
    public List<Role> getRoles() {
		return roles;
	}

	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}

	public String getAnonymousName() {
    	if(this.username == null) {
    		return null;
    	}
    	if(this.username.length() <= 1) {
    		return this.username + "*";
    	}
    	if(this.username.length() == 2) {
    		return this.username.substring(0, 1) + "*";
    	}
    	
    	char[] charArray = this.username.toCharArray();
    	for(int i = 1;i < charArray.length-1;i ++) {
    		charArray[i] = '*';
    	}
    	
    	String array = String.valueOf(charArray);
    	
    	return array;
    }
    
    public String getUsersStatus() {
    	
    	return this.getStatus() == 1 ? "开启" : "关闭";
    }
}