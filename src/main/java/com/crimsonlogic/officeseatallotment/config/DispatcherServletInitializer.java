package com.crimsonlogic.officeseatallotment.config;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;


public class DispatcherServletInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {
 
	@Override
	protected Class<?>[] getRootConfigClasses() {
		return new Class[] { AppContext.class };
		//return null;
	}
 
	@Override
	protected Class<?>[] getServletConfigClasses() {
		return new Class[] { WebConfig.class };
	}
 
	@Override
	protected String[] getServletMappings() {
		return new String[] { "/" };
	}
 
}