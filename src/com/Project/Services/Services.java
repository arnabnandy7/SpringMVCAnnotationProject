package com.Project.Services;

import java.util.List;

import com.Project.Model.loginBean;
import com.Project.Model.user;
import com.Project.Model.userAddress;

public interface Services {
	public String loginAction(loginBean log);
	public int reGistration(user u);
	public List<user> showEmp();
	public List<user> showEmpForAcceptDel();
	public user showEmpForUpdate(String email);
	public userAddress InsertEmpAddressUpdate(String email, String addType);
	public void delete(String email);
	public void accept(String email);
	public void updateInformation(user u);
	public void insertAddressInformation(userAddress userAdd);
}
