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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.hair.common.CodeUtil;
import com.hair.common.ContextString;
import com.hair.common.DateUtils;
import com.hair.model.Dictionary;
import com.hair.model.Grid;
import com.hair.model.Image;
import com.hair.model.Pagination;
import com.hair.model.Product;
import com.hair.service.DictionaryService;
import com.hair.service.ImageService;
import com.hair.service.ProductService;

@RequestMapping("/pro")
@Controller
public class ProductController {

	@Autowired
	ProductService service; 
	
	@Autowired
	DictionaryService dicService;
	
	@Autowired
	ImageService imageService;

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
	public String insertCustomer(Product pro, HttpServletRequest request) {
		service.insertCustomer(pro);
		return "login";
	}

	@RequestMapping("/instVipAjax")
	public void  instVipAjax(Product pro, HttpServletRequest request , HttpServletResponse response 
			,@RequestParam("upfile") MultipartFile[] files) {
		PrintWriter out;
		try {
			pro.getUtf();
			if(pro.getId() != null) {
				service.updateProduct(pro);
			}else {
				service.insertCustomer(pro);
			}
			for(MultipartFile file:files){
				Image image = new Image();
				String name = DateUtils.getDate14() + "_" + new String(file.getOriginalFilename().getBytes("ISO-8859-1"),"UTF-8");
				image.setIname(name);
				image.setType(ContextString.IMAGE_TYPE_PRODUCTDETAIL);
				image.setContect(pro.getId() + "");
				CodeUtil.SaveFileFromInputStream(file ,image);
				image.setType(image.getType());
				imageService.insert(image);
			}
			response.setContentType("text/html;charset=UTF-8");
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
	@RequestMapping("/pro_query")
	public void queryTest(HttpServletResponse response,
			HttpServletRequest request, HttpSession session) {
		String pageNo = request.getParameter("pageNo");
		String pageSize = request.getParameter("pageSize");
		// System.out.println(proName);
		Grid grid = new Grid();
		Product pro = new Product();
		Pagination page = new Pagination(pageNo, pageSize);
		CodeUtil.initPagination(page);
		List<Product> list = service.queryList(pro, page);
		grid.setTotal(Long.valueOf(service.queryListCount(pro)));
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
		model.addAttribute("pro", new Product());
		return "user/product_add";
	}
	
	@RequestMapping("/updateInit/{id}")
	public ModelAndView  updateInit(@PathVariable("id")int id ) {
		ModelAndView mv = new ModelAndView("user/product_add");
		Product pro = service.selectByPrimaryKey(id);
		mv.addObject("pro" , pro);
		 return mv ;
	}
	
	@RequestMapping("/pic/{id}")
	public ModelAndView  pic(@PathVariable("id")int id ) {
		ModelAndView mv = new ModelAndView("user/image_list");
		mv.addObject("picId" , id);
		return mv ;
	}
	
	@ResponseBody
	@RequestMapping(value="/pro_delete/{id}",method=RequestMethod.DELETE)
	public void deleteProduct(@PathVariable("id") int id , HttpServletResponse response){
		PrintWriter out;
		try {
			service.deleteProductById(id);
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
	
	@ResponseBody
	@RequestMapping(value="/getSubType")
	public void deleteProduct(String type  , HttpServletResponse response){
		PrintWriter out;
		try {
			List<Dictionary> list = dicService.selectDicByWhere(type);
			response.setCharacterEncoding("UTF-8");
			out = response.getWriter();
			JSONObject json = new JSONObject();
			json.put("list", list);
			out.println(json);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
