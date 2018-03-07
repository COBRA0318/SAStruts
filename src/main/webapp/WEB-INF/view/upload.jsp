<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Next Page Dayo</title>
</head>
<body>
<h1>Next Page</h1>
	<s:form action="/index" method="POST">
		<div>
    		<table border="1">
	          <c:forEach var="empUpdateItems" items="${empUpdateItems}">
	            <tr>
		            <td><html:checkbox name="empUpdateItems" property="update_check" indexed="true"/></td>
		            <td><html:text name="empUpdateItems" property="name"  indexed="true" /></td>
		        </tr>
		      </c:forEach>
	        </table>
		</div>
		<div>
			<html:multibox property="question2" value="answer1" />答えは
			<html:multibox property="question2">answer2</html:multibox>何だろう
		</div>
		<div>
			<input type="hidden" name="deptId" value="${deptId}"/>
			<input type="submit" name="osakada" value="ReGain"/>
		</div>
		<div>
            id:<html:text property="strParam01" />
            <input type="text" name=${strParam01} value="aaa">
        </div>

        <c:forEach var="i" begin="1" end="4" step="1">
			<c:out value="${k01form.ContinuePro1}" /><br>
			<c:out value="${k01form.ContinuePro1}${i}" /><br>
		</c:forEach>
		<c:set var="hoge" value="ほげ" />

		<c:if test="${hoge == 'ほげ'}">
    		<p>ほげ</p>
		</c:if>
		<h3>Question3</h3>
		<c:out value="${question3}"></c:out>

		<h3>Shops!</h3>
		<div>
			<input type="text" name="shops[0]" value="${k01form.shops[0]}"><br>
			<input type="text" name="shops[1]" value="${k01form.shops[1]}"><br>
			<input type="text" name="shops[2]" value="${k01form.shops[2]}"><br>
		</div>
		<div>
			<input type="checkbox" name="cars[0]" value="${k01form.cars[0]}"><br>
			<input type="checkbox" name="cars[1]" value="${k01form.cars[1]}"><br>
			<input type="checkbox" name="cars[2]" value="${k01form.cars[2]}"><br>
		</div>
	</s:form>

</body>
</html>