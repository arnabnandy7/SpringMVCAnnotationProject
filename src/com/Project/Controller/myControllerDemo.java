package com.Project.Controller;

import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.Project.Model.user;

@Controller
@RequestMapping("/DEMO")
public class myControllerDemo {
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, "dob", new CustomDateEditor(dateFormat, false));
	}
	
	@RequestMapping(value="/info", method= RequestMethod.GET)
	String getInfo(){
		return "demoInfo";
	}
	@RequestMapping(value="/demoReg", method= RequestMethod.GET)
	String getRegForm(){
		return "demoRegister";
	}
	
	@RequestMapping(value="/demoRegister.do",method= RequestMethod.POST)
	public ModelAndView register(@ModelAttribute() user u, BindingResult bindingResult){
			if(bindingResult.hasErrors()){
				return new ModelAndView ("demoRegister","errors",bindingResult.getFieldError());
			}
			ModelAndView mv = new ModelAndView();			
			mv.addObject("user", u);
			mv.addObject("Msg", "Congratulations! You have successfully Registered.");
			mv.setViewName("demoRegSuccess");
			return mv;
	}
}
