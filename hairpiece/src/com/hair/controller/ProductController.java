package com.hair.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import com.hair.common.CodeUtil;
import com.hair.model.Dictionary;
import com.hair.model.Grid;
import com.hair.model.Pagination;
import com.hair.model.Product;
import com.hair.service.DictionaryService;
import com.hair.service.ProductService;

@RequestMapping("/pro")
@Controller
public class ProductController {

	@Autowired
	ProductService service; 
	
	@Autowired
	DictionaryService dicService;

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
	public void  instVipAjax(Product pro, HttpServletRequest request , HttpServletResponse response) {
		PrintWriter out;
		try {
			 // 检测是否为上传请求
		    String contentType = request.getContentType();
		        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		        MultipartFile pic = multipartRequest.getFile("upfile");   
		        if (!pic.isEmpty()) {
		        	String osName =  System.getProperty("os.name");
		        	String path =  System.getProperty("user.dir")  ;
		        	if(osName.toUpperCase().startsWith("MAC")) {
		        		int  splitIndex = System.getProperty("user.dir").lastIndexOf(System.getProperty("file.separator"));
		        		path = System.getProperty("user.dir").substring(0, splitIndex);
		        		path="/Users/wangyoujun/Desktop/smd/WebContent/image";
		        	}
		        	String originalFileName = pic.getOriginalFilename();
		        	// 新的图片
		        	File newFile = new File(path + originalFileName);
		        	// 将内存中的数据写入磁盘
		        CodeUtil.SaveFileFromInputStream(pic.getInputStream(), path, originalFileName);
		        }
			if(pro.getId() != null) {
				service.updateProduct(pro);
			}else {
				service.insertCustomer(pro);
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
