package com.hair.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hair.model.Cart;
import com.hair.model.Dictionary;
import com.hair.model.Image;
import com.hair.model.Product;
import com.hair.service.CartService;
import com.hair.service.DictionaryService;
import com.hair.service.ImageService;
import com.hair.service.ProductService;

@Controller
@RequestMapping("/web")
public class WebController {

	@Autowired
	ProductService proService;

	@Autowired
	DictionaryService dicService;

	@Autowired
	ImageService imageService;
	
	@Autowired
	CartService cartService;

	@RequestMapping("/main")
	public ModelAndView getMain(ModelAndView model, HttpServletRequest request,
			Product pro) {
		getListData(model);
		List<Product> productList = proService.selectProByWhere(pro);
		for (Product product : productList) {
			Image image = new Image();
			image.setContect(product.getId() + "");
			product.setImageList(imageService.selectDicByWhere(image)); 
		}
		model.addObject("productList", productList);
		model.setViewName("forward:/jsp/pages/main.jsp");
		return model;
	}
	
	@RequestMapping("/cartInit")
	public ModelAndView getMsgInit(ModelAndView model, HttpSession session , Cart cart){
		getListData(model);
		Integer userid = (Integer)session.getAttribute("userId");
		cart.setUserid(userid);
		List<Product> productList = cartService.selectProByUser(cart);
		model.addObject("productList", productList);
		model.setViewName("forward:/jsp/pages/main.jsp");
		return model;
	}

	@RequestMapping("/index")
	public ModelAndView getIndex(ModelAndView model, HttpServletRequest request) {
		List<Product> productList = proService.selectProByWhere(new Product());
		List<Product> hotsaleList = new ArrayList<>();
		for (Product product : productList) {
			  if("1".equals(product.getHotsale())) {
				  hotsaleList.add(product);
			  }
		}
		getListData(model);
		model.addObject("hotsaleList", hotsaleList);
		model.addObject("productList", productList);
		model.setViewName("forward:/jsp/pages/index.jsp");
		return model;
	}

	@RequestMapping("/query")
	public ModelAndView queryProIndex(ModelAndView model,
			HttpServletRequest request, Product pro) {
		List<Product> productList = proService.selectProByWhere(pro);
		getListData(model);
		model.addObject("productList", productList);
		model.setViewName("forward:/jsp/pages/index.jsp");
		return model;
	}
	
	@RequestMapping("/detail")
	public ModelAndView detail(ModelAndView model,
			HttpServletRequest request, int id) {
		Product product = proService.selectByPrimaryKey(id);
		Image image  = new Image();
		image.setContect(id+"");
		image.setType(3);
		List<Image> imageList = imageService.selectDicByWhere(image);
		getListData(model);
		model.addObject("product", product);
		model.addObject("imageList", imageList);
		model.setViewName("forward:/jsp/pages/detail.jsp");
		return model;
	}

	public void getListData(ModelAndView model) {
		List<Dictionary> dicList = dicService.selectDicByWhere("");
		List<String> wigsList = new ArrayList<>();
		List<String> extensList = new ArrayList<>();
		List<String> pieceList = new ArrayList<>();
		List<String> eylashsList = new ArrayList<>();
		List<String> infoList = new ArrayList<>();

		for (Dictionary dictionary : dicList) {
			switch (dictionary.getCode()) {
			case "Wigs":
				wigsList.add(dictionary.getName());
				break;
			case "Hair extensions":
				extensList.add(dictionary.getName());
				break;
			case "Hair pieces":
				pieceList.add(dictionary.getName());
				break;
			case "Eyelashs":
				eylashsList.add(dictionary.getName());
				break;
			}
		}
		model.addObject("Wigs", wigsList);
		model.addObject("extensions", extensList);
		model.addObject("pieces", pieceList);
		model.addObject("Eyelashs", eylashsList);
		List<Image> imageList = imageService.selectDicByWhere(new Image());
		List<Image> carouselList = new ArrayList<>();// 轮播图片集合
		List<Image> productList = new ArrayList<>();// 产品分类集合
		for (Image image : imageList) {
			switch (image.getType()) {
			case 1:
				carouselList.add(image);
				break;
			case 2:
				productList.add(image);
				break;
			}
			model.addObject("carouselList", carouselList);
			model.addObject("productList", productList);
			infoList.add("test");
			model.addObject("info", infoList);
		}
	}
	
	@RequestMapping("/about_us")
	public ModelAndView about_us(ModelAndView model,
			HttpServletRequest request) {
		model.setViewName("forward:/jsp/pages/about_us.jsp");
		return model;
	}
	
	@RequestMapping("/acceptable")
	public ModelAndView acceptable(ModelAndView model,
			HttpServletRequest request) {
		model.setViewName("forward:/jsp/pages/acceptable.jsp");
		return model;
	}
	
	@RequestMapping("/contact")
	public ModelAndView contact(ModelAndView model,
			HttpServletRequest request) {
		model.setViewName("forward:/jsp/pages/contact.jsp");
		return model;
	}
	
	@RequestMapping("/order")
	public ModelAndView order(ModelAndView model,
			HttpServletRequest request) {
		model.setViewName("forward:/jsp/pages/order.jsp");
		return model;
	}
	
	@RequestMapping("/shipping")
	public ModelAndView shipping(ModelAndView model,
			HttpServletRequest request) {
		model.setViewName("forward:/jsp/pages/shipping.jsp");
		return model;
	}
	
	@RequestMapping("/Wholesale")
	public ModelAndView Wholesale(ModelAndView model,
			HttpServletRequest request) {
		model.setViewName("forward:/jsp/pages/Wholesale.jsp");
		return model;
	}
	
	@RequestMapping("/information")
	public ModelAndView information(ModelAndView model,
			HttpServletRequest request) {
		model.setViewName("forward:/jsp/pages/information.jsp");
		return model;
	}
}
