<%@ page import="test.seaser.form.K01Form" %>
<jsp:useBean id="formBean"  scope="request" class="test.seaser.form.K01Form" />

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Schedule Display</title>
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
        var $parent1  = $(".tabContBox").eq(1).parent();
        var $parent2 = "1";
	});
	</script>
</head>
<body>
<h1>Schedule</h1>
<div>
</div>
<fmt:formatDate value="${today}" type="DATE" pattern="yyyy年M月dd日（E） a KK時mm分ss秒" />
<div id="tabroot">
		<div id="tab1"></div>
		<div id="tab2">
	        <div id="tabBorder">
	    	   <li class="tabBorder0" style="width:50%">
	    	   <li class="tabBorder1" style="width:50%">
	        </div>
			<div id="c-box" class="tabContBox">
				<table border=4 width=250 align=center>
				 <caption>【テーブルの黄】</caption>
				 <tr bgcolor="#cccccc">
				  <th><br></th>
				  <th>列-A</th>
				  <th>列-B</th>
				  <th>列-C</th>
				 </tr>
				 <tr align=center>
				  <td>行-1</td>
				  <td>A1</td>
				  <td>B1</td>
				  <td rowspan=2>C1-C2</td>
				 </tr>
				 <tr align=center>
				  <td>行-2</td>
				  <td>A2</td>
				  <td>B2</td>
				 </tr>
				 <tr align=center>
				  <td>行-3</td>
				  <td>A3</td>
				  <td colspan=2>A3-B3</td>
				 </tr>
				</table>
			</div>

<c:if test="${ mLstSchedule != null && !mLstSchedule.isEmpty() }" >
			<div id="d-box" class="tabContBox">
				<table border=4 width=250 align=center>
				 <caption>【テーブルの緑】</caption>
				 <tr bgcolor="#cccccc">
				  <th><br></th>
				  <th>列-X</th>
				  <th>列-Y</th>
				  <th>列-Z</th>
				 </tr>
				 <tr align=center>
				  <td>行-1</td>
				  <td>A1</td>
				  <td>B1</td>
				  <td rowspan=2>C1-C2</td>
				 </tr>
				 <tr align=center>
				  <td>行-2</td>
				  <td>A2</td>
				  <td>B2</td>
				 </tr>
				 <tr align=center>
				  <td>行-3</td>
				  <td>A3</td>
				  <td colspan=2>A3-B3</td>
				 </tr>
				</table>
			</div>
</c:if>
		</div>
</div>

<%-- if(formBean.today.compareTo(formBean.tommorow) > 0 ){ --%>


<h3>${msgDaijyobu}～</h3>
<%-- <c:if test="${n1 > n2}"> --%>
<c:if test="${today.compareTo(tommorow) > 0 }">

<h3>Listの長さは${fn:length(mLstSchedule)}</h3>
</c:if>0

<c:if test="${mList.size() > 0 }">
<h5>mList:${mList.size()}</h5>
<h4>メンバ変数リストデータあり</h4>

</c:if>
<%-- } --%>

</body>
</html>