package com.hair.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hair.model.Dictionary;
import com.hair.model.Product;
import com.hair.service.DictionaryService;
import com.hair.service.ProductService;

@Controller
@RequestMapping("/web")
public class WebController {

	@Autowired
	ProductService proService;

	@Autowired
	DictionaryService dicService;


	@RequestMapping("/index")
	public ModelAndView getIndex(ModelAndView model,HttpServletRequest request) {
		List<Product> productList = proService.selectProByWhere(new Product() );
		getListData(model);
		model.addObject("productList", productList);
		model.setViewName("forward:/jsp/pages/index.jsp");
		return model;
	}

	@RequestMapping("/query")
	public ModelAndView queryProIndex(ModelAndView model,
			HttpServletRequest request, Product pro ) {
		List<Product> productList = proService.selectProByWhere(pro);
		getListData(model);
		model.addObject("productList", productList);
		model.setViewName("forward:/jsp/pages/index.jsp");
		return model;
	}
	
	public void getListData(ModelAndView model){
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
		infoList.add("test");
		model.addObject("info", infoList);
	}

}
