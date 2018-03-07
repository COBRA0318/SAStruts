<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<html>
    <head>
      <meta http-equiv="content-type" content="text/html; charset=utf-8">
      <title>エラー</title>
      <link rel="STYLESHEET" href="todo.css" type="text/css">
    </head>
    <body>
        <h1>エラー</h1>
        <hr>
        <div><html:errors/>
        </div>
        <div align="center">
            <table border="0">
                    <tr>
                        <td class="add_field">
                            エラーが発生しました。<br>
                        </td>
	                </tr>
	                <tr>
	                <html:errors/>
<html:messages id="msg" message="true">
<bean:write name="msg" ignore="true"/>
</html:messages>
		            </tr>
                    <tr>
                        <td class="add_button">
                        	<s:form action="/index">
	                            <s:submit value="戻る"/>
	                        </s:form>
                        </td>
                    </tr>
            </table>
         </div>
     </body>
</html>
