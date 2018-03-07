<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="smp" uri="/WEB-INF/tlds/sample" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CTagのサンプルです Insert title here</title>
</head>
<body>

<!-- あなたが入力した名前は「Foo」です。 -->
<smp:listTag />

<%
//(2)パラメータ名（name）を指定し、パラメータ値
//   を取得します。
out.println(request.getParameter("name"));
out.println("<BR><BR>");

out.println("2.getParameterValuesメソッドの使用例です。");
out.println("<BR>");

%>

<smp:SampleTag name="${requestScope.strAnkenNo}" />

<%-- <smp:SampleTag name="<%=request.getAttribute(\"strAnkenNo\") %>"" /> --%>
</body>
</html>