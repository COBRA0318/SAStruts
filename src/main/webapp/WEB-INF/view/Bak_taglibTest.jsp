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
</style>

  <body>
    <h3>JSP7章 実習課題1</h3>

     <%
      List list = new LinkedList();
      list.add(new String("<div class=\"a-box\">長田</div>"));
      list.add(new String("		<div class=\"b-box\">坂本</div>"));
      list.add(new String("		<div class=\"c-box\">浜田</div>"));
      list.add(new String("<div class=\"d-box\">中尾</div>"));
      application.setAttribute("list", list);
      %>
    <div>
      <myTag:listTag list="list" item="item">
        <%= pageContext.getAttribute("item") %>
      </myTag:listTag>
    </div>

  </body>
</html>