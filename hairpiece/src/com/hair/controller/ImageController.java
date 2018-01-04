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
import com.hair.model.Grid;
import com.hair.model.Image;
import com.hair.model.Pagination;
import com.hair.service.ImageService;

@RequestMapping("/image")
@Controller
public class ImageController {

	@Autowired
	ImageService service;

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

	@RequestMapping("/insert")
	public void instVipAjax(Image image, HttpServletRequest request , HttpServletResponse response ,
			@RequestParam("file") MultipartFile[] files) {
		PrintWriter out;
		try {
			for(MultipartFile file:files){
				CodeUtil.SaveFileFromInputStream(file ,image);
				image.setType(image.getType());
				if(image.getId() != null) {
					service.updateImage(image);
				}else {
					service.insert(image);
				}
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
	@RequestMapping("/image_query")
	public void queryTest(HttpServletResponse response,
			HttpServletRequest request, HttpSession session , Image image) {
		String pageNo = request.getParameter("pageNo");
		String pageSize = request.getParameter("pageSize");
		// System.out.println(imageName);
		Grid grid = new Grid();
		Pagination page = new Pagination(pageNo, pageSize);
		CodeUtil.initPagination(page);
		List<Image> list = service.queryList(image, page);
		grid.setTotal(Long.valueOf(service.queryListCount(image)));
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
		model.addAttribute("image", new Image());
		return "user/image_add";
	}
	
	
	@RequestMapping("/addProInit")
	public String addProInit(Model model) {
		model.addAttribute("image", new Image());
		return "user/proimage_add";
	}
	
	@RequestMapping("/updateInit/{id}")
	public ModelAndView  updateInit(@PathVariable("id")int id ) {
		ModelAndView mv = new ModelAndView("user/imagetionary_add");
		Image image = service.selectByPrimaryKey(id);
		mv.addObject("image" , image);
		 return mv ;
	}
	
	@ResponseBody
	@RequestMapping(value="/image_delete/{id}",method=RequestMethod.DELETE)
	public void deleteImage(@PathVariable("id") int id , HttpServletResponse response){
		PrintWriter out;
		try {
			service.deleteImageById(id);
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
