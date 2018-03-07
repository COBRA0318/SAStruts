<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page contentType="text/html; charset=utf-8" import="java.util.*" %>
<%@taglib uri="/WEB-INF/sample.tld" prefix="myTag" %>
<html>
  <head><title>JSP7章 実習課題1</title></head>
  <body>
    <h3>JSP7章 実習課題1</h3>
    <%
      List list = new LinkedList();
      list.add(new String("test1"));
      list.add(new String("test2"));
      list.add(new String("test3"));
      list.add(new String("test4"));
      application.setAttribute("list", list);
      %>
    <table border="1"><tr>
      <myTag:listTag list="list" item="item">
        <td><%= pageContext.getAttribute("item") %></td>
      </myTag:listTag>
    </tr></table>

  </body>
</html>