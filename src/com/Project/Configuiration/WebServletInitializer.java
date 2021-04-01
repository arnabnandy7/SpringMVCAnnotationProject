package com.Project.Configuiration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;

import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.servlet.DispatcherServlet;


public class WebServletInitializer implements WebApplicationInitializer {
	@Override
	public void onStartup(ServletContext ServletCtx) throws ServletException {	
		
        AnnotationConfigWebApplicationContext ApplicationCtx = new AnnotationConfigWebApplicationContext();        
        ApplicationCtx.register(RootConfig.class); //RootContext
        ApplicationCtx.register(ServletConfig.class); //ServletContext
        ApplicationCtx.setServletContext(ServletCtx);               
        
        ServletRegistration.Dynamic servlet = ServletCtx.addServlet("dispatcher", new DispatcherServlet(ApplicationCtx));
        servlet.setAsyncSupported(true);
        servlet.setLoadOnStartup(1);
        servlet.addMapping("/");        
    }
}

/*
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;
public class WebServletInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {
	
	@Override
    protected Class<?>[] getRootConfigClasses() {
        return new Class[] { RootConfig.class, ServletConfig.class };
    }
     
    @Override
    protected Class<?>[] getServletConfigClasses() {
        return null;
    }

    @Override
    protected String[] getServletMappings() {
        return new String[] { "/" };
    }
}
*/