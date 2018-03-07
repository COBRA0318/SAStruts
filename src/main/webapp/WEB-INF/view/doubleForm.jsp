<%@ page import="test.seaser.form.K01Form" %>
<jsp:useBean id="formBean"  scope="request" class="test.seaser.form.K01Form" />

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Double Form Test</title>
	<style type="text/css">
	#a-box {
	           border-bottom: 1px solid #FF9900;
	           background-image: url('img/header.gif');
	 }

	#b-box {
	           float: left;
	           width: 500px;
	 }

	#c-box {
	           clear: both;
	           width: 750px;
	           background-color: #FF9900;
	 }

	#d-box {
	           clear: both;
	           width: 750px;
	           background-color: #FFFF99;
	 }
	</style>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
	<script>
	  $(document).ready(function(){

	    $("#c-box").click(function() {
			  alert("#C-box clicked");
		  $("#d-box").removeClass("selected");
		  $("#c-box").addClass("selected");
	    });

	    $("#d-box").click(function() {
			  alert("#D-box clicked");
			  $("#c-box").removeClass("selected");
			  $("#d-box").addClass("selected");
		});

<!--		$(".tabContBox").eq(1).addClass("selected") -->

	});
	</script>
</head>
<body>
<h1>Double Forms</h1>
<div>
</div>
<fmt:formatDate value="${today}" type="DATE" pattern="yyyy年M月dd日（E） a KK時mm分ss秒" />

<s:form action="/upload" method="GET">>
	<input type="text" name="nojima" />
    <s:submit value="Login"/>
</s:form>

<s:form action="/upload" method="GET">>
	<input type="text" name="nojima" />
    <s:submit value="Login" />
</s:form>



<c:if test="${mList.size() > 0 }">
	<h5>mList:${mList.size()}</h5>
	<h4>メンバ変数リストデータあり</h4>
</c:if>



</body>
</html>