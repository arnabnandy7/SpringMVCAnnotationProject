package com.Project.Controller;


import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.Project.Model.*;
import com.Project.Services.Services;
import com.google.gson.Gson;

@Controller
@SessionAttributes("welcomeMessage")
public class myController1 {
	@Autowired
	Services services;
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, "dob", new CustomDateEditor(dateFormat, false));
	}
	
	@RequestMapping(value="/login.do",method= RequestMethod.POST)
	public ModelAndView login(@ModelAttribute()loginBean log){		
		String action = services.loginAction(log);		
		if (action.equals("false")){		
			return new ModelAndView("loginerror", "loginFail", "Please Enter Valid Information");
		}
		else if (action.equals("Admin")){			
			return new ModelAndView("welcomePage", "welcomeMessage", action);
		}
		else {
			ModelAndView mv = new ModelAndView();
			mv.setViewName("welcomeHomePage");
			mv.addObject("welcomeMessage", action);
			mv.addObject("user", log.getEmail());
			return mv;
		}
	}
	
	@RequestMapping(value="/showEmp",method= RequestMethod.GET)	
	public String showEmpList(HttpServletRequest req,HttpServletResponse res, Model m){		
		List<user> us = services.showEmp();		
		m.addAttribute("key1", us);		
		return "empList";
	}
	@RequestMapping(value="/accDel",method= RequestMethod.GET)
	public ModelAndView showEmpList(){	
		List<user> us = services.showEmpForAcceptDel();		
		return new ModelAndView("acceptDelete","key1",us);		
	}
	@RequestMapping(value="/updateInfo/{email}",method= RequestMethod.GET)
	public ModelAndView showEmpforUpdate(@PathVariable("email") String email){		
		user us = services.showEmpForUpdate(email);		
		return new ModelAndView("empUpdate","key1",us);		
	}
	@RequestMapping(value="/insertUpdateAddressInfo/{email}",method= RequestMethod.GET)
	public ModelAndView insertUpdateAddressInfo(@PathVariable("email") String email){	
		userAddress useradd = new userAddress();
		useradd.setEmail(email);
		return new ModelAndView("empAddress","key1",useradd);		
	}
	//*********************User Address*******************
	@RequestMapping(value="/insertUpdateAddressInfo", method= RequestMethod.GET)	
	public @ResponseBody String InsertEmpAddressUpdate(HttpServletRequest req){		
		Gson gson=new Gson();		
		String email = req.getParameter("email");
		String addType = req.getParameter("addType");
		userAddress userAdd = services.InsertEmpAddressUpdate(email,addType);
		Map<String, String> add=new HashMap<String, String>();
		add.put("address", userAdd.getAddress());
		add.put("city", userAdd.getCity());
		add.put("pin", userAdd.getPin());
		add.put("state", userAdd.getState());
		add.put("country", userAdd.getCountry());
		String s1=  gson.toJson(add);
		return s1;
		}	
		//***********************************************************
	@RequestMapping(value="/accept",method= RequestMethod.POST)
	public String accept(HttpServletRequest req,HttpServletResponse res, ModelMap modelMap){
		try{
			if(req.getParameterValues("emailCheck") != null){
				for(String email: req.getParameterValues("emailCheck")){
					services.accept(email);
				}
			}
			return "welcomePage";
		}
		catch (Exception e){
			modelMap.put("error", e.getMessage());
			modelMap.put("key1",services.showEmpForAcceptDel());
			return "acceptDelete";
		}				
	}
	@RequestMapping(value="/delete",method= RequestMethod.POST)
	public String delete(HttpServletRequest req,HttpServletResponse res, ModelMap modelMap){
		try{
			if(req.getParameterValues("emailCheck") != null){
				for(String email: req.getParameterValues("emailCheck")){
					services.delete(email);
				}
			}
			return "welcomePage";
		}
		catch (Exception e){
			modelMap.put("error", e.getMessage());
			modelMap.put("key1",services.showEmpForAcceptDel());
			return "acceptDelete";
		}		
	}
	@RequestMapping(value="/updateUserInformation",method= RequestMethod.POST)
	public ModelAndView updateUser(@ModelAttribute()user u, BindingResult bindingResult){	
		System.out.println("From Controller : " +u.getDob());
		services.updateInformation(u);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("welcomeHomePage");
		mv.addObject("welcomeMessage");
		mv.addObject("user", u.getEmail());
		return mv;
	}
	 
}