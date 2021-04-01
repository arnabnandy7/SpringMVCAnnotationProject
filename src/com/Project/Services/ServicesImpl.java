package com.Project.Services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Project.Dao.MyDao;
import com.Project.Model.loginBean;
import com.Project.Model.user;
import com.Project.Model.userAddress;

@Service
public class ServicesImpl implements Services {
	@Autowired
	MyDao dao;
	
	@Override
	public String loginAction(loginBean log) {		
		return dao.loginAction(log);
	}

	@Override
	public int reGistration(user u) {
		return dao.reGistration(u);
	}

	@Override
	public List<user> showEmp() {
		return dao.showEmp();
	}

	@Override
	public List<user> showEmpForAcceptDel() {
		return dao.showEmpForAcceptDel();
	}

	@Override
	public user showEmpForUpdate(String email) {
		return dao.showEmpForUpdate(email);
	}

	@Override
	public userAddress InsertEmpAddressUpdate(String email, String addType) {
		return dao.InsertEmpAddressUpdate(email, addType);
	}

	@Override
	public void delete(String email) {
		dao.delete(email);
	}

	@Override
	public void accept(String email) {
		dao.accept(email);
	}

	@Override
	public void updateInformation(user u) {
		dao.updateInformation(u);
	}

	@Override
	public void insertAddressInformation(userAddress userAdd) {
		dao.insertAddressInformation(userAdd);
	}

}
