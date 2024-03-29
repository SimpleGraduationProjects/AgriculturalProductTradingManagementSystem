package com.controller;


import com.dao.CartDAO;
import com.dao.InventoryDAO;
import com.dao.MemberDAO;
import com.dao.OrdermsgDAO;
import com.dao.OrdermsgdetailsDAO;
import com.dao.ProductDAO;
import com.entity.Inventory;
import com.entity.Member;
import com.entity.Ordermsg;
import com.entity.Ordermsgdetails;
import com.entity.Product;
import com.entity.User;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Controller
public class StatisticesController {
    @Resource
	CartDAO cartDao;
	@Resource
	ProductDAO productDao;
	@Resource
	OrdermsgDAO ordermsgDAO;
	@Resource
	OrdermsgdetailsDAO ordermsgdetailsDAO;
	@Resource
	MemberDAO memberDAO;
	@Resource
	InventoryDAO inventoryDAO;
	


	@RequestMapping("/admin/statisticsNum")
	public  String saleProduct(HttpServletRequest request) {
		User shop = (User)request.getSession().getAttribute("admin");

		HashMap map = new HashMap();
		map.put("leibie", "购买商品");
		if(!shop.getUsertype().equals("管理员")){
			map.put("saver", shop.getId());
			
		}
		List<Product> plist = productDao.selectProductAll(map);
		//ArrayList nslist = new ArrayList();
		ArrayList nlist = new ArrayList();
		ArrayList slist = new ArrayList();
		for(Product product:plist){
			
			int outnum = 0;
			HashMap map1 = new HashMap();
			map1.put("productid", product.getId());
			map1.put("type", "out");
			List<Inventory> outlist = inventoryDAO.selectAll(map1);
			for(Inventory out:outlist){
				outnum += out.getNum();
			}
			nlist.add("'"+product.getProductname()+"'");
			slist.add(outnum);
		}
		request.setAttribute("nlist", nlist);
		request.setAttribute("slist", slist);
		return "admin/tjnum";
	}


	//销售额
	@RequestMapping("/admin/selectSaleMoney")
	public  String selectSaleMoney(HttpServletRequest request) {
		User shop = (User)request.getSession().getAttribute("admin");
		
		HashMap map = new HashMap();
		map.put("fkstatus", "交易完成");
		if(!shop.getUsertype().equals("管理员")){
			map.put("saver", shop.getId());
		}
		map.put("goodstype", "购买商品");
		List<Ordermsg> olist = ordermsgDAO.selectSaleMoney(map);
		//ArrayList nslist = new ArrayList();
		ArrayList nlist = new ArrayList();
		ArrayList slist = new ArrayList();
		for(Ordermsg dingdan:olist){
			nlist.add("'"+dingdan.getSavetime()+"'");
			slist.add(dingdan.getTotal());
		}
		request.setAttribute("nlist", nlist);
		request.setAttribute("slist", slist);
		return "admin/tjsalemoney";
	}
	
	
	//活跃度
	@RequestMapping("/admin/statisticsHy")
	public  String statisticsHy(HttpServletRequest request) {
		String key = request.getParameter("key");
		User shop = (User)request.getSession().getAttribute("admin");
		ArrayList nlist = new ArrayList();
		ArrayList slist = new ArrayList();
		HashMap map = new HashMap();
		List<Member> mlist = memberDAO.selectAll(map);
		for(Member member:mlist){
			nlist.add("'"+member.getTname()+"'");
			map.put("memberid", member.getId());
			map.put("goodstype", "购买商品");
			map.put("status", "交易完成");
			if(!shop.getUsertype().equals("管理员")){
				map.put("saver", shop.getId());
			}
			map.put("key", key);
			List<Ordermsg> orderlist = ordermsgDAO.selectAll(map);
			slist.add(orderlist.size());
		}
		request.setAttribute("nlist", nlist);
		request.setAttribute("slist", slist);
		request.setAttribute("key", key);
		return "admin/tjhy";
	}

	

}
