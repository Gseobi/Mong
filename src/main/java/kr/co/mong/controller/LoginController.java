package kr.co.mong.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/login")
public class LoginController {

	@GetMapping("/login")
	public String Login() {
		return "login/login";
	}
	
	@PostMapping("/login")
	public String login(@RequestParam("inputID") String Id, @RequestParam("inputPassword") String Pw,
			HttpSession session, Model model) {
		if (LoginService.login(Id, Pw)) {
			session.setAttribute("Id", Id); // 세션에 어드민 아이디 저장
			return "redirect:mian"; // 로그인 성공 시 대시보드로
		} else {
			return "redirect:login/login";
		}
	}
}
