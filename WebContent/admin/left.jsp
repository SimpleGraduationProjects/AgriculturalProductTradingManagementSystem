<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<title>农产品交易平台</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Visitors Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="text/javascript" src="<%=path %>/admin/js/jquery2.0.3.min.js"></script>
</head>
<SCRIPT language=javascript>
window.onload=function (){
	$(".sub-menu").hide();
	$(".sub-menu").show();
	//$("#news1").show();
	$(".sub").show();
}
</SCRIPT>
<body>
    <div id="sidebar" class="nav-collapse">
        <!-- sidebar menu start-->
        <div class="leftside-navigation">
            <ul class="sidebar-menu" id="nav-accordion">
                <li>
                    <a class="active" href="index.do">
                        <i class="fa fa-dashboard"></i>
                        <span>首页</span>
                    </a>
                </li>
              <!--  
                <li class="sub-menu"  id="sysmsg">
                    <a href="javascript:;">
                        <i class="fa fa-book"></i>
                        <span>系统管理</span>
                    </a>
                    <ul class="sub"  >
						<li ><a href="showAbout.do?id=1&pagemsg=sysmsg">关于我们</a></li>
						<li><a href="glyphicon.html">滚动图片</a></li>
                        <li><a href="grids.html">活动管理</a></li>
                    </ul>
                </li>
                 --> 
                 <c:if test="${sessionScope.admin.usertype eq '管理员'}">
                 <li class="sub-menu">
                    <a href="javascript:;">
                        <i class="fa fa-book"></i>
                        <span>系统信息</span>
                    </a>
                    <ul class="sub">
						<li><a href="showAbout.do?id=1">关于我们</a></li>
						<li><a href="pictureList.do">滚动图片</a></li>
                    </ul>
                </li>
                
                <li class="sub-menu">
                    <a href="javascript:;">
                        <i class="fa fa-book"></i>
                        <span>会员管理</span>
                    </a>
                    <ul class="sub">
						<li><a href="memberList.do">会员信息</a></li>
                    </ul>
                </li>
                </c:if>
                <li class="sub-menu" id="news">
                    <a href="javascript:;">
                        <i class="fa fa-book"></i>
                        <span>业务管理</span>
                    </a>
                    <ul class="sub" id="news1">
                    <c:if test="${sessionScope.admin.usertype eq '管理员'}">
                    	<!-- <li><a href="applyList.do">入驻申请</a></li>
                    	<li><a href="userList.do">商家管理</a></li> -->
						<li><a href="newsList.do">资讯列表</a></li>
						<li><a href="categoryList.do">类别列表</a></li>
						<li><a href="productMsg.do">商品管理</a></li>
						<li><a href="inventoryList.do">商品库存</a></li>
						<li><a href="orderList.do">订单管理</a></li>
						<li><a href="shapplyList.do">售后管理</a></li>
						<li><a href="messageList.do">留言管理</a></li>
						</c:if>
						<c:if test="${sessionScope.admin.usertype eq '商家'}">
						<c:choose>
						  <c:when test="${sessionScope.admin.shstatus eq '通过审核'}">
							<li><a href="productMsg.do">商品管理</a></li>
							<li><a href="inventoryList.do">商品库存</a></li>
							<li><a href="orderList.do">订单管理</a></li>
							<li><a href="shapplyList.do">售后管理</a></li>
						  </c:when>
						  <c:otherwise>
						  	<li><a href="applyshop.jsp">入驻申请</a></li>
						  	<li><a href="applyLb.do">申请列表</a></li>
						  </c:otherwise>
						</c:choose>
						</c:if>
						
                    </ul>
                </li>
                
                <li class="sub-menu" id="news">
                    <a href="javascript:;">
                        <i class="fa fa-book"></i>
                        <span>统计分析</span>
                    </a>
                    <ul class="sub" id="news1">
                        <li><a href="statisticsHy.do">顾客活跃度</a></li>
						<li><a href="selectSaleMoney.do">营业额统计</a></li>
						<li><a href="statisticsNum.do">销售量</a></li>
                    </ul>
                </li>
                
                
                
                
            </ul>            
         </div>
        <!-- sidebar menu end-->
    </div>
</body>
</html>
