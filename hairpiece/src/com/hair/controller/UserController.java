package com.hair.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hair.common.CodeUtil;
import com.hair.model.Grid;
import com.hair.model.Pagination;
import com.hair.model.User;
import com.hair.service.UserService;

import net.sf.json.JSONObject;


@RequestMapping("/user")
@Controller
public class UserController {
	 
	@Autowired
	UserService service ;
	
	
	@RequestMapping("/checkUser")
	public String checkUser(User user , HttpServletRequest request , HttpSession session){
		user = service.checkUser(user);
		if(user != null ){
			session.setAttribute("user", user.getUserName());
			session.setAttribute("roleid", user.getRoleId());
				return "index" ;
		}else{
			request.setAttribute("msg", "用户名或者密码错误");
			return "login" ;
		}
	}
	
	@RequestMapping("/login")
	public String login(){
		return "login";
	}
	
	@RequestMapping("/register")
	public String register(){
		return "register";
	}

	@RequestMapping("/loginOut")
	public String logout(HttpSession session){
		session.removeAttribute("agentcode");
		session.removeAttribute("user");
		return "login";
	}
	
	@RequestMapping("/instVip")
	public String insertCustomer(User user , HttpServletRequest request ) {
		user.setRoleId("2");
		service.insertCustomer(user);
		return "login";
	}
	
	@RequestMapping("/user_query")
	public void queryTest( HttpServletResponse response, HttpServletRequest request  ,HttpSession session ) {
		String userName = request.getParameter("userName");
		String pageNo = request.getParameter("pageNo");
		String pageSize = request.getParameter("pageSize");
		//System.out.println(userName);
		Grid grid = new Grid();
	    User user = new User();
	    user.setUserName(userName);
		Pagination page =  new Pagination(pageNo, pageSize) ;
	    CodeUtil.initPagination(page);
		List<User> list = service.queryList(user , page );
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
	public  String addInit() {
		return "user/user_add";
	}
}
