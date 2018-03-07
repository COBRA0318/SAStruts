<%@ page import="test.seaser.form.K01Form" %>
<jsp:useBean id="formBean"  scope="request" class="test.seaser.form.K01Form" />

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Schedule Display</title>
	<style type="text/css">
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

	.hideform{
		visibility:visible;
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

	    $('#ogura').click(function() {
			  alert($("input[name='hoge']:checked").val());
			  document.forms[0].action="/Seasar_Tags/sasParts2";
			  document.forms[0].target = "_blank";
			  document.forms[0].method = "GET";
			  document.forms[0].submit();
		});

	    $('#shira').click(function() {
	    	alert($(":hidden[name=inp1]").val() == ''))
		});
	    $( 'input[name="hoge"]:radio' ).change( function() {
	    	alert( $( this ).val()); // valueを表示
	    });
<!--		$(".tabContBox").eq(1).addClass("selected") -->
        var $parent1  = $(".tabContBox").eq(1).parent();
        var $parent2 = "1";
	});
	</script>
</head>
<body>
<h1>sasParts</h1>
<div>
	<s:form styleId="inputForm">
		<div>
			<html:radio property="hoge" value="v1" />
			<html:radio property="hoge" value="v2" />
			<input type="button" id="ogura" value="ラジオ選択値"/>
		</div>
		<div>
			<html:select property="selCobra">
				<html:option value="op1">選択1</html:option>
				<html:option value="op2">選択2</html:option>
				<html:option value="op3">選択3</html:option>
			</html:select>
		</div>

		<input type="text" name="inp1" value="検索テキスト１"/>
		<s:submit value="上部送信"></s:submit>
			<s:link href="/">Lets Go!</s:link>s
	</s:form>
	<s:link href="/">LinkYo</s:link>s
	<s:form styleId="searchCondForm" styleClass="hideform">
		<div>
			<input type="button" id="oota" value="第２フォームボタン"/>
		</div>
		<input type="hidden" name="inp1" value="${hiddenValue}" />
		<s:submit value="下部送信"></s:submit>
	</s:form>

	<input type="button" id="shira" value="非表示送信用ボタン"/>
</div>
</body>
</html>