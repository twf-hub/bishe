package com.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport;

import com.interceptor.AuthorizationInterceptor;

@Configuration
public class InterceptorConfig extends WebMvcConfigurationSupport{
	
	@Bean
    public AuthorizationInterceptor getAuthorizationInterceptor() {
        return new AuthorizationInterceptor();
    }
	
	@Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(getAuthorizationInterceptor())
        	.addPathPatterns("/**")
	        // 前后端静态资源、上传图片资源都不走鉴权，否则直接打开后台登录页会被拦截成 401 JSON
	        .excludePathPatterns("/admin/**")
	        .excludePathPatterns("/front/**")
        	.excludePathPatterns("/static/**")
        	.excludePathPatterns("/upload/**")
        	.excludePathPatterns("/img/**");
        super.addInterceptors(registry);
	}
	
	/**
	 * springboot 2.0配置WebMvcConfigurationSupport之后，会导致默认配置被覆盖，要访问静态资源需要重写addResourceHandlers方法
	 * 这里特别为用户上传的图片（运行目录下的 upload/）增加资源映射，
	 * 保证管理员、教练、学员上传的图片都能通过 /jiaxiaoyuyuexuexixitong/upload/xxx.jpg 访问。
	 */
	@Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
		// 上传的图片，优先映射到项目运行目录下的 upload/
		registry.addResourceHandler("/upload/**")
			.addResourceLocations("file:" + System.getProperty("user.dir") + "/upload/")
			.addResourceLocations("classpath:/static/upload/");

		registry.addResourceHandler("/**")
        .addResourceLocations("classpath:/resources/")
        .addResourceLocations("classpath:/static/")
        .addResourceLocations("classpath:/admin/")
        .addResourceLocations("classpath:/img/")
        .addResourceLocations("classpath:/front/")
        .addResourceLocations("classpath:/public/");
		super.addResourceHandlers(registry);
    }
}
