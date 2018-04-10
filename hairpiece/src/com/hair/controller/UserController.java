package com.hair.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hair.common.CodeUtil;
import com.hair.model.Grid;
import com.hair.model.Pagination;
import com.hair.model.User;
import com.hair.service.EmailSendService;
import com.hair.service.UserService;

@RequestMapping("/user")
@Controller
public class UserController {

	@Autowired
	UserService service;
	@Autowired
	EmailSendService  emailService ;
	
	/**
	 *  后台登陆 
	 */
	@RequestMapping("/checkUser")
	public String checkUser(User user, HttpServletRequest request,
			HttpSession session) {
		user = service.checkUser(user);
		if (user != null) {
			session.setAttribute("userbean", user.getUserName());
			session.setAttribute("userId", user.getId());
			session.setAttribute("roleId",user.getRoleId());
			return "index";
		} else {
			request.setAttribute("msg", "用户名或者密码错误");
			return "login";
		}
	}
	
	/**
	 * 后台登出
	 */
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("userbean");
		session.removeAttribute("userId");
		session.removeAttribute("roleId");
		return "login";
	}
	
	/**
	 *  网站登陆
	 */
	@RequestMapping("/signin")
	public ModelAndView signin(ModelAndView model,HttpServletRequest request
			, HttpSession session , User user) {
		User bean  = service.checkUser(user);
		if(bean != null && bean.getId() != null && bean.getId() > 0 ){
			session.setAttribute("userbean", bean.getUserName());
			session.setAttribute("userId",bean.getId());
			session.setAttribute("roleId",bean.getRoleId());
			model.setViewName("forward:/web/index");
		}else{
			request.setAttribute("msg", "用户名或者密码错误");
			model.setViewName("signup");
		}
		return model;
	}

	/**
	 * 网站登出
	 * @param session
	 * @return
	 */
	@RequestMapping("/loginOut")
	public String signout(HttpSession session) {
		session.removeAttribute("userbean");
		session.removeAttribute("userId");
		session.removeAttribute("roleId");
		return "forward:/web/index";
	}

	@RequestMapping(value = "/checkUnique")
	public void checkUnique(HttpServletResponse response, String userNo) {
		PrintWriter out;
		try {
			Long sum = service.checkUnique(userNo);
			response.setCharacterEncoding("UTF-8");
			out = response.getWriter();
			JSONObject json = new JSONObject();
			if(sum > 0){
				json.put("success", false);
				json.put("msg", "登录名不可用！");
			}else{
				json.put("success", true);
				json.put("msg", "登录名可用");
			}
			out.println(json);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping("/login")
	public String login() {
		return "login";
	}

	@RequestMapping("/register")
	public String register() {
		return "register";
	}
	
	@RequestMapping("/signup")
	public String signup() {
		return "signup";
	}


	@RequestMapping("/instVip")
	public String insertCustomer(User user, HttpServletRequest request) {
		user.setRoleId("2");
		try {
			emailService.sendMail(user);
		} catch (Exception e) {
			request.setAttribute("msg",e.getMessage());
			return "register";
		}
		service.insertCustomer(user);
		return "init";
	}

	
	@RequestMapping("/instVipAjax")
	public void instVipAjax(User user, HttpServletRequest request , HttpServletResponse response) {
		PrintWriter out;
		try {
			
			if(user.getId() != null) {
				service.updateUser(user);
			}else {
				service.insertCustomer(user);
			}
			response.setCharacterEncoding("UTF-8");
			out = response.getWriter();
			JSONObject json = new JSONObject();
			json.put("success", true);
			json.put("msg", "操作成功");
			out.println(json);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	@RequestMapping("/user_query")
	public void queryTest(HttpServletResponse response,
			HttpServletRequest request, HttpSession session) {
		String userName = request.getParameter("userName");
		String pageNo = request.getParameter("pageNo");
		String pageSize = request.getParameter("pageSize");
		// System.out.println(userName);
		Grid grid = new Grid();
		User user = new User();
		user.setUserName(userName);
		Pagination page = new Pagination(pageNo, pageSize);
		CodeUtil.initPagination(page);
		List<User> list = service.queryList(user, page);
		grid.setTotal(Long.valueOf(service.queryListCount(user)));
		grid.setRows(list);
		PrintWriter out;
		try {
			response.setContentType("text/html;charset=UTF-8");
			out = response.getWriter();
			JSONObject json = new JSONObject();
			json = JSONObject.fromObject(grid);
			out.println(json);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping("/addInit")
	public String addInit(Model model) {
		model.addAttribute("user", new User());
		return "user/user_add";
	}
	
	@RequestMapping("/updateInit/{id}")
	public ModelAndView  updateInit(@PathVariable("id")int id ) {
		ModelAndView mv = new ModelAndView("user/user_add");
		User user = service.selectByPrimaryKey(id);
		mv.addObject("user" , user);
		 return mv ;
	}
	
	@ResponseBody
	@RequestMapping(value="/user_delete/{id}",method=RequestMethod.DELETE)
	public void deleteUser(@PathVariable("id") int id , HttpServletResponse response){
		PrintWriter out;
		try {
			service.deleteUserById(id);
			response.setCharacterEncoding("UTF-8");
			out = response.getWriter();
			JSONObject json = new JSONObject();
			json.put("success", true);
			json.put("msg", "操作成功");
			out.println(json);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
