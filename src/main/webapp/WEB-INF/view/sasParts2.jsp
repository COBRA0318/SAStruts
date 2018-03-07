<%@ page import="test.seaser.form.K01Form" %>
<jsp:useBean id="formBean"  scope="request" class="test.seaser.form.K01Form" />

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Schedule DisplayÂÂ</title>
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
	</style>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
	<script>
    var age;

	<c:choose>
    <c:when test="${age >= 30}">age="あ";</c:when>
    <c:when test="${age >= 20}">age="い";</c:when>
    <c:when test="${age >= 10}">age="う";</c:when>
    <c:otherwise>age="他";</c:otherwise>
</c:choose>

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
		});

	    $( 'input[name="hoge"]:radio' ).change( function() {
	    	alert( $( this ).val()); // valueãè¡¨ç¤º
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
	<s:form>
		<div>
			<html:radio property="hoge" value="v1" />
			<html:radio property="hoge" value="v2" />
			<input type="button" id="ogura" value="ã©ã¸ãªé¸æå¤"/>
		</div>
		<div>
			<html:select property="selCobra">
				<html:option value="op1">é¸æ1</html:option>
				<html:option value="op2">é¸æ2</html:option>
				<html:option value="op3">é¸æ3</html:option>
			</html:select>
		</div>

		<c:choose>
		    <c:when test="${age >= 30}">３０代以上</c:when>
		    <c:when test="${age >= 20}">２０代</c:when>
		    <c:when test="${age >= 10}">１０代</c:when>
		    <c:otherwise>１０歳以下</c:otherwise>
		</c:choose>
	</s:form>

</div>
</body>
</html>