<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%-- ↓↓↓↓↓ ポイント ↓↓↓↓↓ --%>

<script type="text/javascript" src="./index/"></script>

<%-- ↑↑↑↑↑ ポイント ↑↑↑↑↑ --%>

<title>マツコの世界</title>
	<style type="text/css">
		#jquery-sample-ajax, #jquery-sample-ajax2{
		    margin: 10px;
		    padding: 10px;
		    height: 50px;
		    width: 200px;
		    background-color: yellow;
		    border: 1px solid gray;
		    border-radius: 10px;
		}

	</style>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js"></script>
	<script>

	<%-- (2)変数xを宣言 --%>
	<%! int x = 0; %>

	<%-- (3)スクリプトレット内でforループ処理を実行 --%>
	<%
	  for (int i = 0; i < 15; i++) {
	    x++;
	  }
	%>

	var objTab = {};

	// OK objTab['[on1, on2]']='bagu';
/*
	<c:forEach var="obj" items="${k01form.str2}" varStatus="status">
		objTab['<c:out value="${obj}" />']='Gackt';
	</c:forEach>

    objTab['153']='hagu';
*/


	$(document).ready(function(){
		var totalCnt = '<%=x %>';
		var hogeId = '<%=request.getAttribute("userid") %>';

//		alert(objTab['on1']);

	    var TabGrade = {};

		var abc = new Object();
		abc.id   ="A01"
		abc.title="TIT01"
		abc.url  ="http://osafune.com"

		TabGrade[abc.id]=abc;

		abc.id   ="B01"
		abc.title="BIT01"
		abc.url  ="http://saidaji.jp"

		TabGrade[abc.id]=abc;

        $("input:button[name=okuru2]").click(function(data){

        	// 情報取得元区分
        	var v_kbn = "2";
        	var v_dispCount = 403;

        	$('#jquery-sample-ajax2').empty();

			//jQueryの$.ajaxによるJSONの読み込み
			var jqxhr = $.ajax({
  			  type: 'POST',
			  url: '/Seasar_Tags/parts',
			  data:
				  {"request['a']" : "value1", "request['b']" : "value2"}
			  ,
			  dataType: 'html'
			})

			jqxhr.success(function(data) {
				alert("success3!!");
				$('#jquery-sample-ajax2').append(data);

			})

			.error(function() {
			  // do something
			  alert("error3!!");
			});
        });
	  });
	</script>
</head>
<body>

<h1>API Action Start!</h1>
	<s:form action="/upload" method="POST">
	<html:text property="str3"></html:text>
		<div>
			<input type="hidden" name="infoKbn" value="1"/>
		</div>
		<jsp:useBean id="date" class="java.util.Date"/>
		<fmt:formatDate value="${date}" pattern="yyyy年MM月dd日（E） a KK時mm分ss秒" /><br>
		<div>
			 <html:select property="deptId">
				 <html:option value="1">岡山</html:option>
				 <html:option value="2">香川</html:option>
				 <html:option value="3">鹿児島</html:option>
			 </html:select>
		</div>
		<div>
			<input type="text" name="deptId"><br>
			<input type="text" name="InfoKbn"><br>

			<input type="text" name="pagePCnt"><br>
		</div>
		<div id="checkArea">
			<input type="checkbox" name="cars[0]">
			<input type="checkbox" name="cars[1]">
			<input type="checkbox" name="cars[2]">
		</div>
		<div>
			<input type="hidden" name="infoKbn" value="1"/>
		</div>
		<div>
			<input type="button" value="ajaxパーツ開始" name="okuru2">
		</div>
		<div>
			<s:submit value="チェック送信" />
		</div>

	</s:form>
</body>
</html>