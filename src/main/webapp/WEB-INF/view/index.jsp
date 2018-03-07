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
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
	<script>

	<%-- (2)変数xを宣言 --%>
	<%! int nIdx = 0; %>

	<%-- (3)スクリプトレット内でforループ処理を実行 --%>
	<%
	  for (int i = 0; i < 15; i++) {
	    nIdx++;
	  }
	%>

	var objTab = {};

	// OK objTab['[on1, on2]']='bagu';

 	<c:forEach var="obj" items="${k01form.str2}" varStatus="status">
		objTab['<c:out value="${obj}" />']='Gackt';
	</c:forEach>
var objSList = {};
 	<c:forEach var="obj" items="${k01form.shiharaiKbnRecordList}" varStatus="status">
	objSList['<c:out value="${obj.Kbn}" />']='Angie';
</c:forEach>

    //OK
 //   objTab['153']='hagu';

function change(){

<!--

 var str = '';



 str += '<select name=\"stringData[]\" multiple size=\"3\">';

 str += '<option value=\"1\">野球</option>';

 str += '<option value=\"2\">水泳</option>';

 str += '<option value=\"3\">ゴルフ</option>';

 str += '</select>';



 document.getElementsByName('stringData')[0].innerHTML = str;

//-->

}


	$(document).ready(function(){
		change();
		var totalCnt = '<%= nIdx %>';
		var hogeId = '<%=request.getAttribute("userid") %>';
//JavaScriptに引数渡す
//OK
// osakada
//        alert(totalCnt);

//OK
//alert(objTab['on1']);

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

        $("input:button[name=okuru]").click(function(data){
        	var x = {
     			  M: [1, 2, 3],
     			  N: {
     			    X: 'FOO',
     			    Y: 'BAR'
     			  }
     		};

        	// 情報取得元区分
        	var v_kbn = "1";
        	var v_dispCount = 203;

			//jQueryの$.ajaxによるJSONの読み込み
			var jqxhr = $.ajax({
  			  type: 'POST',
			  url: '/Seasar_Tags/load_json',
			  data: {
				   "infoKbn" : v_kbn,
				   "request[0]" : "value1", "request[1]" : "value2",
				   "empCheckedItems[0].departmentId" : "31775154",
				   "empCheckedItems[1].departmentId" : "31805154",
				   "empCheckedItems[2].departmentId" : "31806199",
				   "empCheckedItems[0].update_check" : "true",
				   "empCheckedItems[1].update_check" : "true",
				   "empCheckedItems[2].update_check" : "false",
				   "searchCond.repCd" : "15595",
				   "searchCond.selStsCd" : "728"
			  },
  			  dataType: 'json'
			})

			jqxhr.success(function(data) {

                 jQuery.each( data, function( key, value ) {
                     jQuery( '#jquery-sample-ajax' ).append( '<p>' + key + ': ' + value + '</p>'   );
                 } );

			  		alert(TabGrade["A01"].title);
			})
			.error(function() {
			  // do something
			  alert("error!!");
			});
        });

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

<%--  <logic:iterate id="aaa" name="k01Form" property="shiharaiKbnRecordList">
	<html:hidden name="aaa" property="hoge" />
	<logic:iterate id="map" name="aaa" property="bbbMap">
		<html:hidden indexed="true" name="aaa" property="bbbMap(${map.key})" />
	</logic:iterate>
</logic:iterate> --%>


<%
  // (1) スクリプトレット上で変数を宣言.
  String test = "テストです";
%>

<c:set var="test2" value="<%= test %>" />

${test2}

<h1>Tags Tutorial!</h1>
	<s:form action="/upload" method="POST">
	<html:text property="str3"></html:text>
		<jsp:useBean id="date" class="java.util.Date"/>
		<fmt:formatDate value="${date}" pattern="yyyy年MM月dd日（E） a KK時mm分ss秒" /><br>
		<div>
			<html:multibox property="question2" value="answer1" />キャンディー
			<html:multibox property="question2">answer2</html:multibox>チョコレー
		</div>
				<input type="button" value="ajax開始" name="okuru">
		<div id="jquery-sample" border>
			<p>
				<span id="jquery-sample-ajax"></span>
			</p>
		</div>
		<div>
			<img src="${url1}"  width="128" height="128" />
			<img src="${url2}"  width="128" height="128" />
		</div>
		<div>
			<span>"${innerText1}"</span>
		</div>
		<div>
			 <html:select property="deptId">
				 <html:option value="1">北海道</html:option>
				 <html:option value="2">東北</html:option>
				 <html:option value="3">関東</html:option>
			 </html:select>
		</div>
		<div>
			<input type="text" name="shops[0]"><br>
			<input type="text" name="shops[1]"><br>
			<input type="text" name="shops[2]"><br>
		</div>
		<div id="checkArea">
			<input type="checkbox" name="cars[0]">
			<input type="checkbox" name="cars[1]">
			<input type="checkbox" name="cars[2]">
		</div>
		<div id="listArea">
    		<table border="1">
	          <c:forEach var="empUpdateItems" items="${empUpdateItems}">
	            <tr>
		            <td><html:checkbox name="empUpdateItems" property="update_check" indexed="true"/></td>
		            <td><html:text name="empUpdateItems" property="name"  indexed="true" /></td>
		            <td><html:hidden name="empUpdateItems" property="departmentId"  indexed="true" /></td>
		      </c:forEach>
	        </table>
		</div>
		<div>
			<input type="text" name="infoKbn" value="6"/>
		</div>
		<h4>配列サイズ</h4>
		<div>
			${fn:length(str2)}
		</div>
		<div>
			${fn:length(strArr4)}
		</div>
		<div>
			<s:submit value="送信1" />
		</div>

	</s:form>
	<s:form action="/parts" method="POST">
		<div id="jquery-sample2" border>
			<p>
				<span id="jquery-sample-ajax2"></span>
			</p>

		</div>
		<div>
			<input type="button" value="ajaxパーツ開始" name="okuru2">
		</div>

		<html:select property="stringData" value="02" >
　　<html:optionsCollection property="mapData" value="key" label="value" />
</html:select>
	</s:form>




</body>
</html>