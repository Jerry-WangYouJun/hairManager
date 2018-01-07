package com.hair.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hair.model.Cart;
import com.hair.service.CartService;

import net.sf.json.JSONObject;

@RequestMapping("/cart")
@Controller
public class CartController {

	@Autowired
	CartService service;


	
	
	@RequestMapping("/insert")
	public void instVipAjax(Cart cart, HttpSession session , HttpServletResponse response) throws IOException {
		PrintWriter out;	
		JSONObject json = new JSONObject();
		String userId = session.getAttribute("userId").toString();
			cart.setUserid(Integer.valueOf(userId));
			int sum = service.insert(cart);
			response.setCharacterEncoding("UTF-8");
				out = response.getWriter();
			if(sum > 0){
				json.put("success", true);
				json.put("msg", "success!");
			}
			out.println(json);
	}

	@RequestMapping("/addInit")
	public String addInit(Model model , Cart cart , HttpSession session) {
		List<Cart> list = service.selectDicByWhere(cart);
		model.addAttribute("list", list);
		model.addAttribute("cart", new Cart());
		return "user/cart_add";
	}
	
	
	@ResponseBody
	@RequestMapping(value="/message_delete/{id}",method=RequestMethod.DELETE)
	public void deleteCart(@PathVariable("id") int id , HttpServletResponse response){
		PrintWriter out;
		try {
			service.deleteCartById(id);
			response.setCharacterEncoding("UTF-8");
			out = response.getWriter();
			JSONObject json = new JSONObject();
			json.put("success", true);
			json.put("cart", "操作成功");
			out.println(json);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
