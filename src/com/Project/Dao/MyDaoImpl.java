package com.Project.Dao;


import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.Project.Model.loginBean;
import com.Project.Model.user;
import com.Project.Model.userAddress;

@Repository
public class MyDaoImpl implements MyDao {

	JdbcTemplate template;
	public JdbcTemplate getTemplate() {
		return template;
	}
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}
	
	public String loginAction(loginBean log){		
		String flag = "false";
		if(log.getEmail().equals("ad@admin.com")){
			if(log.getPassword().equals("admin")){
				flag="Admin";
			}				
		}
		else {
		String sql="select fname,lname,email from user where email='"+log.getEmail()+"' and password= '"+log.getPassword()+"' ";
		try{
			user u =template.queryForObject(sql,new BeanPropertyRowMapper<user>(user.class));
			flag= u.getFname()+" "+u.getLname();
		}
 catch (Exception e) {
				return flag;
			}	    
		}
		return flag;
	}
	public int reGistration(user u){
		
		String sql="insert into user(fname,lname,email,password,sex,dob,phone) "
				+ "values('"+u.getFname()+"','"+u.getLname()+"','"+u.getEmail()+"','"+u.getPassword()+"','"+u.getSex()+"','"+new java.sql.Date(u.getDob().getTime())+"','"+u.getPhone()+"')";
		return template.update(sql);		
	}
	public List<user> showEmp(){
		String sql = "select * FROM user WHERE verify = 'Y' ";
		List<user> u  = template.query(sql,new BeanPropertyRowMapper<user>(user.class));
		return u;
	}
	public List<user> showEmpForAcceptDel(){
		String sql = "select * FROM user WHERE verify = 'N' ";
		List<user> u  = template.query(sql,new BeanPropertyRowMapper<user>(user.class));
		return u;
	}
	public user showEmpForUpdate(String email){		
		email= email+"%";
		String sql = "select fname,lname,email,sex,dob,phone FROM user WHERE email like '"+email+"'";		
		return template.queryForObject(sql,new BeanPropertyRowMapper<user>(user.class));		
	}
	//*********************User Address*******************
	public userAddress InsertEmpAddressUpdate(String email, String addType){		
		email= email+"%";
		
		String sql = "select email,address_type,address,city,pin,state,country FROM user_address WHERE email like '"+email+"' and address_type = '"+addType+"'";		
		return template.queryForObject(sql,new BeanPropertyRowMapper<userAddress>(userAddress.class));		
	}	
		//***********************************************************
	public void delete(String email){  
	    String sql="delete from user where email='"+email+"'";  
	    template.update(sql);  
	}
	public void accept(String email){  
	    String sql="update user set verify = 'Y' where email='"+email+"'";  
	    template.update(sql);  
	}
	public void updateInformation(user u){		
	    String sql="update user set dob='"+new java.sql.Date(u.getDob().getTime())+"',sex='"+u.getSex()+"',phone='"+u.getPhone()+"' where email='"+u.getEmail()+"'";  
	    template.update(sql);  
	}
	public void insertAddressInformation(userAddress userAdd){
		String email= userAdd.getEmail()+"%";
		userAddress a = this.InsertEmpAddressUpdate(userAdd.getEmail(), userAdd.getAddType());
		if(a == null){
		String sql="insert into user_address(email,address_type,address,city,pin,state,country) "
				+ "values('"+userAdd.getEmail()+"','"+userAdd.getAddType()+"','"+userAdd.getAddress()+"','"+userAdd.getCity()+"','"+userAdd.getPin()+"','"+userAdd.getState()+"','"+userAdd.getCountry()+"')";
	    template.update(sql);
		}
		else{			
			String	sql="Update user_address set address = '"+userAdd.getAddress()+"', city = '"+userAdd.getCity()+"', pin = '"+userAdd.getPin()+"', state = '"+userAdd.getState()+"', country ='"+userAdd.getCountry()+"' ";
					sql+= "Where email like '"+email+"' and address_type = '"+userAdd.getAddType()+"'";
		    template.update(sql);
		}
	}
}
