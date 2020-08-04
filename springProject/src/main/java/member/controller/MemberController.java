package member.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import member.bean.MemberDTO;
import member.bean.ZipcodeDTO;
import member.service.MemberService;

@Controller
@RequestMapping("member")
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="login", method=RequestMethod.POST)
	public @ResponseBody String login(@RequestParam Map<String, String> map,
									  HttpSession session) {
		MemberDTO memberDTO = memberService.login(map);
		
		String loginFail = null;
		if(memberDTO == null) {
			loginFail = "fail";
			
		}else {
			session.setAttribute("memName", memberDTO.getName());
			session.setAttribute("memId", map.get("id"));
			session.setAttribute("memEmail", memberDTO.getEmail1()+"@"+memberDTO.getEmail2());
			
			loginFail = "success";
		}
		
		return loginFail;
	}
	
	@RequestMapping(value="logout", method=RequestMethod.GET)
	public ModelAndView logout(HttpSession session, Model model) {
		session.invalidate();
		return new ModelAndView("redirect:/main/index");
	}
	

	@RequestMapping(value="writeForm", method=RequestMethod.GET)
	public String writeFrom(Model model) {
		model.addAttribute("display", "/member/writeForm.jsp");
		return "/main/index";
	}

	@RequestMapping(value="checkId", method=RequestMethod.POST)
	@ResponseBody
	public String checkId(@RequestParam String id) {
		return memberService.checkId(id);
	}
	
	@RequestMapping(value="checkPost", method=RequestMethod.GET)
	public String checkPost() {
		return "/member/checkPost";
	}

	
	@RequestMapping(value="getZipcodeList", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView getZipcodeList(@RequestParam Map<String, String> map) {
		List<ZipcodeDTO> list = memberService.getZipcodeList(map);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list",list);
		mav.setViewName("jsonView");
		return mav;
		
	}
	
	@RequestMapping(value="write", method=RequestMethod.POST)
	public String write(@ModelAttribute MemberDTO memberDTO, Model model) {
		memberService.write(memberDTO);
		
		model.addAttribute("display", "/member/write.jsp");
		return "/main/index";
	}
	
	@RequestMapping(value="modifyForm", method=RequestMethod.GET)
	public String modifyForm(HttpSession session, Model model) {
		String id = (String) session.getAttribute("memId");
		MemberDTO memberDTO = memberService.getMember(id);
		
		model.addAttribute("memberDTO", memberDTO);
		model.addAttribute("display", "/member/modifyForm.jsp");
		return "/main/index";
	}
	
	@RequestMapping(value="modify", method=RequestMethod.POST)
	@ResponseBody
	public void modify(@ModelAttribute MemberDTO memberDTO) {
		System.out.println(memberDTO);
		memberService.modify(memberDTO);
	}
	
	
	
}


/*
 public String login(@RequestParam String id, @RequestParam String pwd, HttpSession session) {
	Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pwd", pwd);
		MemberDTO memberDTO = memberService.login(map);
		
		String loginResult = null;
		if(memberDTO != null) {
			session.setAttribute("memName", memberDTO.getName());
			session.setAttribute("memId", id);
			session.setAttribute("memEmail", memberDTO.getEmail1() + "@" + memberDTO.getEmail2());
			loginResult="success";
		}else {
			loginResult="fail";
		}
		return loginResult;
	}
*/