package kr.co.mong.config;

import org.apache.commons.dbcp2.BasicDataSource;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import kr.co.mong.bean.AccountBean;
import kr.co.mong.interceptor.LoginCheck;

//Spring MVC 프로젝트에 관련된 설정을 하는 클래스
@Configuration

//Controller 어노테이션이 셋팅되어 있는 클래스를 Controller로 등록한다.
@EnableWebMvc

//DB 연결 PropertySource 경로 등록
@PropertySource("/WEB-INF/properties/db.properties")

//스캔할 패키지를 지정한다.
@ComponentScan({ "kr.co.mong.config", "kr.co.mong.controller", "kr.co.mong.service", "kr.co.mong.mapper",
		"kr.co.mong.dao", "kr.co.mong.bean", "kr.co.mong.interceptor" })
public class ServletAppContext implements WebMvcConfigurer {

	@Autowired
	private AccountBean loginBean;

	// ===DB 접속 정보 Value값 지정=============================================
	@Value("${db_classname}")
	private String db_classname;

	@Value("${db_url}")
	private String db_url;

	@Value("${db_username}")
	private String db_username;

	@Value("${db_password}")
	private String db_password;

	// === view 및 resources 적용을 위한 메서드들 (Start)

	// Controller 메서드가 반환하는 jsp 이름 앞뒤에 경로, 확장자 설정
	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		registry.jsp("/WEB-INF/views/", ".jsp");
	}

	// 정적 파일 경로 매핑
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
	}
	// === view 및 resources 적용을 위한 메서드들 (End)

	// ===DB 접속 정보를 관리하는 Bean=============================================
	@Bean
	public BasicDataSource dataSource() {
		BasicDataSource source = new BasicDataSource();
		source.setDriverClassName(db_classname);
		source.setUrl(db_url);
		source.setUsername(db_username);
		source.setPassword(db_password);
		return source;
	}

	// == 로그인 빈 관리 ===============================================

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		WebMvcConfigurer.super.addInterceptors(registry);

		LoginCheck adminLoginCheckInterceptor = new LoginCheck(loginBean);
		InterceptorRegistration reg = registry.addInterceptor(adminLoginCheckInterceptor);
		reg.addPathPatterns("/admin/**"); // 관리자 페이지의 모든 하위 경로에 적용
		reg.excludePathPatterns("/admin/login/**"); // 로그인 관련 경로는 제외

	}


	// === Error Message 등록
	// ========================================================================
	@Bean
	public ReloadableResourceBundleMessageSource messageSource() {
		ReloadableResourceBundleMessageSource res = new ReloadableResourceBundleMessageSource();
		res.setDefaultEncoding("UTF-8"); // 글자 꺠짐 방지 UTF-8 Encoding Set
		res.setBasenames("/WEB-INF/properties/error_message"); // Error Message File 경로 지정
		return res;
	}

	// 메세지와 property 충돌을 막기 위함.
	// 소스와 메시지 별도 관리 하도록 property를 Bean으로 등록
	@Bean
	public static PropertySourcesPlaceholderConfigurer PropertySourcesPlaceholderConfigurer() {
		return new PropertySourcesPlaceholderConfigurer();
	}

	// ===이하 아래======= DB 및 Mapper 관련 객체들
	// ====================================================

	// 쿼리문과 접속 정보를 관리하는 객체
	@Bean
	public SqlSessionFactoryBean factory(BasicDataSource source) throws Exception {
		SqlSessionFactoryBean factoryBean = new SqlSessionFactoryBean();
		factoryBean.setDataSource(source);
		return factoryBean;
	}

	// AdminUsermapper등록
	/*
	@Bean
	public MapperFactoryBean<AdminUserMapper> adminBuyerMapper(SqlSessionFactory factory) throws Exception {
		MapperFactoryBean<AdminUserMapper> adminUserMapper = new MapperFactoryBean<>(AdminUserMapper.class);
		adminUserMapper.setSqlSessionFactory(factory);

		return adminUserMapper;
	}
	*/
	
	@Bean
	public StandardServletMultipartResolver multipartResolver() {
		return new StandardServletMultipartResolver();
	}

}
