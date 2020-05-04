package com.Project.Controller;

import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.Project.Model.user;
import com.Project.Model.userAddress;
import com.Project.Services.Services;

@Controller
@SessionAttributes("welcomeMessage")
public class myController2 {
	
	@Autowired
	Services services;
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, "dob", new CustomDateEditor(dateFormat, false));
	}
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String myPage(Model model){
		model.addAttribute("Msg", "Thank you for Choosing Spring...");
		return "homePage1";
	}
	@RequestMapping(value="/loginPage", method=RequestMethod.GET)
	public String myLoginPage(){
		return "loginPage";
	}
	@RequestMapping(value="/register",method= RequestMethod.GET)
	public String registration(){
		return "register";
	}
	@RequestMapping(value="/returnAdmin", method = RequestMethod.GET )
    public String returnAdmin(ModelMap model, HttpSession session)  {
		//public ModelAndView returnAdmin(ModelMap model, HttpSession session)  {
		//model.addAttribute("welcomeMessage", session.getAttribute("welcomeMessage"));        
        //return new ModelAndView("welcomePage",model);
		return "redirect:welcomePage";
    }
	@RequestMapping(value="/register.do",method= RequestMethod.POST)
	public ModelAndView register(@ModelAttribute()user u, BindingResult bindingResult){		
		int action = services.reGistration(u);
		if (action > 0){		
			return new ModelAndView("homePage1","Msg", "You have successfully Registered...");
		}
		else{			
			return new ModelAndView("register", "RegFail", "Registration failed! Please Enter Valid Information..");
		}		
	}
	@RequestMapping(value="/insertUpdateUserAddress",method= RequestMethod.POST)
	public ModelAndView updateUser(@ModelAttribute()userAddress userAdd){		
		services.insertAddressInformation(userAdd);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("welcomeHomePage");
		mv.addObject("welcomeMessage");
		mv.addObject("user", userAdd.getEmail());
		return mv;
	}
}