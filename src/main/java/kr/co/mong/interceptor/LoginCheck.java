package kr.co.mong.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

import kr.co.mong.bean.AccountBean;

public class LoginCheck implements HandlerInterceptor {

	private AccountBean loginBean;

	public LoginCheck(AccountBean loginBean) {
		this.loginBean = loginBean;

	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		if (loginBean.isLogin() == false) {

			// 로그인 하지 않은 경로 호출
			String contextPath = request.getContextPath();
			response.sendRedirect(contextPath + "/login/not_login");

			return false;

		}

		return true;
	}

}
