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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hair.common.CodeUtil;
import com.hair.common.DateUtils;
import com.hair.model.Grid;
import com.hair.model.Message;
import com.hair.model.Message;
import com.hair.model.Pagination;
import com.hair.service.MessageService;

@RequestMapping("/msg")
@Controller
public class MessageController {

	@Autowired
	MessageService service;

	

	@RequestMapping("/msgInit")
	public String getMsgInit(Model model, HttpSession session , Message msg
			, @RequestParam(value = "role",required=false)String role){
		Message m = new Message();
		if( "2".equals(role) ){
			System.out.println(session.getAttribute("userId"));
			 m.setContect((Integer)session.getAttribute("userId"));
		}else{
			m.setContect(msg.getContect());
		}
		List<Message> messageList = service.selectDicByWhere(m);
		model.addAttribute("messageList", messageList);
		model.addAttribute("contect" , m.getContect());
		return "user/msg_add";
	}
	
	@RequestMapping("/insert")
	public String instVipAjax(Message msg, HttpSession session , HttpServletResponse response) {
			String name = session.getAttribute("userbean").toString();
			msg.setName(name);
			msg.setTime(DateUtils.getFormatDate(DateUtils.getDate12()));
			service.insert(msg);
			return "forward:/msg/msgInit";
	}

	@RequestMapping("/addInit")
	public String addInit(Model model , Message msg , HttpSession session) {
		List<Message> list = service.selectDicByWhere(msg);
		model.addAttribute("list", list);
		model.addAttribute("msg", new Message());
		return "user/msg_add";
	}
	
	@RequestMapping("/message_query")
	public void queryTest(HttpServletResponse response,
			HttpServletRequest request, HttpSession session , Message message) {
		String pageNo = request.getParameter("pageNo");
		String pageSize = request.getParameter("pageSize");
		// System.out.println(messageName);
		Grid grid = new Grid();
		Pagination page = new Pagination(pageNo, pageSize);
		CodeUtil.initPagination(page);
		List<Message> list = service.queryList(message, page);
		grid.setTotal(Long.valueOf(service.queryListCount(message)));
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
	
	@ResponseBody
	@RequestMapping(value="/message_delete/{id}",method=RequestMethod.DELETE)
	public void deleteMessage(@PathVariable("id") int id , HttpServletResponse response){
		PrintWriter out;
		try {
			service.deleteMessageById(id);
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
