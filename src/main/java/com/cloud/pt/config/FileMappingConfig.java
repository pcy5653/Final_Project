package com.cloud.pt.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class FileMappingConfig implements WebMvcConfigurer{
	
	@Value("${app.upload.mapping}")
	private String filePath;
	
	@Value("${app.url.path}")
	private String urlPath;

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler(urlPath)
			.addResourceLocations(filePath);
	}
	
	

}
