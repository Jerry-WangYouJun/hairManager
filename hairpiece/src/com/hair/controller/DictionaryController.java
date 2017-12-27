package com.hair.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hair.common.CodeUtil;
import com.hair.model.Dictionary;
import com.hair.model.Grid;
import com.hair.model.Pagination;
import com.hair.service.DictionaryService;

import net.sf.json.JSONObject;

@RequestMapping("/dic")
@Controller
public class DictionaryController {

	@Autowired
	DictionaryService service;

	@RequestMapping(value = "/checkUnique")
	public void checkUnique(HttpServletResponse response, String code) {
		PrintWriter out;
		try {
			Long sum = service.checkUnique(code);
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

	@RequestMapping("/instVip")
	public String insertCustomer(Dictionary dic, HttpServletRequest request) {
		service.insertCustomer(dic);
		return "login";
	}

	@RequestMapping("/instVipAjax")
	public void instVipAjax(Dictionary dic, HttpServletRequest request , HttpServletResponse response) {
		PrintWriter out;
		try {
			
			if(dic.getId() != null) {
				service.updateDictionary(dic);
			}else {
				service.insertCustomer(dic);
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
	@RequestMapping("/dic_query")
	public void queryTest(HttpServletResponse response,
			HttpServletRequest request, HttpSession session) {
		String dicCode = request.getParameter("code");
		String pageNo = request.getParameter("pageNo");
		String pageSize = request.getParameter("pageSize");
		// System.out.println(dicName);
		Grid grid = new Grid();
		Dictionary dic = new Dictionary();
		dic.setCode(dicCode);
		Pagination page = new Pagination(pageNo, pageSize);
		CodeUtil.initPagination(page);
		List<Dictionary> list = service.queryList(dic, page);
		grid.setTotal(Long.valueOf(service.queryListCount(dic)));
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
		model.addAttribute("dic", new Dictionary());
		return "user/dictionary_add";
	}
	
	@RequestMapping("/updateInit/{id}")
	public ModelAndView  updateInit(@PathVariable("id")int id ) {
		ModelAndView mv = new ModelAndView("user/dictionary_add");
		Dictionary dic = service.selectByPrimaryKey(id);
		mv.addObject("dic" , dic);
		 return mv ;
	}
	
	@ResponseBody
	@RequestMapping(value="/dic_delete/{id}",method=RequestMethod.DELETE)
	public void deleteDictionary(@PathVariable("id") int id , HttpServletResponse response){
		PrintWriter out;
		try {
			service.deleteDictionaryById(id);
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
