<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page contentType="text/html; charset=utf-8" import="java.util.*" %>
<%@taglib uri="/WEB-INF/sample.tld" prefix="myTag" %>
<html>
  <head><title>JSP7章 実習課題1</title></head>

<style type="text/css">
a-box {
          border-bottom: 1px solid #FF9900;
          background-image: url('img/header.gif');
}

.b-box {
          float: left;
}

.c-box {
          float: right;
}

.d-box {
          clear: both;
          background-color: #FFFF99;
}

.R1 ,.R2 {
	border : 1px;
 	display: block;
 	height:  10px;
 	width :  20px;
 	background-color: #FFFF99;
 }

</style>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>

<script>

	  $(document).ready(function(){
		  	$(".boxWrapper").children("div.normal").not(".selected").click(function() {
		  		alert($(this).text());
		    });

		  	$(".boxWrapper").children("div").not(".normal").has(":hidden").click(function() {
		  		alert($(this).children(":hidden").val());
		    });
	  });
</script>

  <body>
    <h3>JSP7章 実習課題1</h3>

    <div>
      <myTag:listTag list="list" item="item"
      dispPage="${dispPage02}" pageNumMax="${pageNumMax}"  totalDataCount="${totalDataCount}">
<%--        <%= pageContext.getAttribute("item") %> --%>
      </myTag:listTag>
    </div>

  </body>
</html>