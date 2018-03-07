/*
 * Copyright 2004-2008 the Seasar Foundation and the Others.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
 * either express or implied. See the License for the specific language
 * governing permissions and limitations under the License.
 */
package test.seaser.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.seasar.struts.annotation.ActionForm;
import org.seasar.struts.annotation.Execute;
import org.seasar.struts.util.ActionMessagesUtil;
import org.seasar.struts.util.ResponseUtil;
import org.seasar.extension.jdbc.JdbcManager;
import org.seasar.framework.container.SingletonS2Container;
import org.seasar.framework.container.factory.SingletonS2ContainerFactory;
import org.seasar.framework.beans.util.*;

import net.arnx.jsonic.JSON;
import test.seaser.dto.EmployeeDto;
import test.seaser.dto.appliInfoBean;
import test.seaser.dto.scheduleBean;
import test.seaser.form.K01Form;
import test.seaser.service.ServiceOrder;
import test.seaser.dto.EmployeeDto;

public class JsonAction {
	@ActionForm
	@Resource
	public K01Form k01form;

	public List<String> mList;

	private static final String RESULT_NAME = "java_cnst=";

	@Resource
	protected HttpServletRequest request;

	@Resource
	protected HttpServletResponse response;

    @Execute(validator = false)
	public String index() {

    	k01form.setUrl1("/Seasar_Tags/icon/images1.jpg");
    	k01form.setUrl2("/Seasar_Tags/icon/images2.jpg");
    	k01form.setInnerText1("代々木ゼミは岡山から撤退します。");

    	EmployeeDto dto1 = new EmployeeDto();
    	dto1.name="大森";
    	dto1.update_check = false;
    	dto1.departmentId = "1101513";

    	EmployeeDto dto2 = new EmployeeDto();
    	dto2.name="大久保";
    	dto2.update_check = false;
    	dto2.departmentId = "2101511";

    	EmployeeDto dto3 = new EmployeeDto();
    	dto3.name="大町";
    	dto3.update_check = false;
    	dto3.departmentId = "3300513";

    	k01form.empUpdateItems = new ArrayList<EmployeeDto>();
    	k01form.empUpdateItems.add(dto1);
    	k01form.empUpdateItems.add(dto2);
    	k01form.empUpdateItems.add(dto3);

		List<EmployeeDto> lstEmpDest = new ArrayList<EmployeeDto>();

			for(EmployeeDto item1 : k01form.empUpdateItems)
			{
				lstEmpDest.add(item1);
			}
		System.out.println("Add End");

String strJSON = JSON.encode(k01form.empUpdateItems);

//useridデータをrequestスコープで保存
request.setAttribute("userid", "NakaOka Yo");

k01form.str2 = new String[2];
k01form.str2[0] = "on1";
k01form.str2[1] = "on2";
k01form.str3 = "Osakada";

	return "/index.jsp";
}


    @Execute(validator = false)
	public String upload() {

    	Enumeration names = request.getParameterNames();

    	k01form.setStrParam01("kimurakengo");

    	k01form.setContinuePro1("21");
    	k01form.setContinuePro2("22");
    	k01form.setContinuePro3("23");
    	k01form.setContinuePro4("24");

        ArrayList<Map> mapList = new ArrayList<Map>();
        Map<String, String> map = new HashMap<String, String>();
        map.put("valueName", "1");
        map.put("labelName", "f:labelを使用した値1");
        Map<String, String> map2 = new HashMap<String, String>();
        map2.put("valueName", "2");
        map2.put("labelName", "f:labelを使用した値2");
        mapList.add(map);
        mapList.add(map2);
//        request.setAttribute("value", "2");
//        request.setAttribute("dataList", mapList);
    	k01form.setQuestion3("Hase Hirosi");
        return "upload.jsp";
	}

    //Ajax実験用 Ajax用 JSON用
    @Execute(validator = true,input="error.html")
    public String load_json() throws IOException {

	   Map<String, String> map = new HashMap<String, String>();

        map.put("301", "tarou");
        map.put("401", "jirou");


        HttpServletResponse httpServletResponse = ResponseUtil.getResponse();
        httpServletResponse.setContentType("application/json");
        PrintWriter sendPoint = new PrintWriter(httpServletResponse.getOutputStream());

        //Entity→JSON形式に変換して出力します。
        sendPoint.println(JSON.encode(map));
        sendPoint.flush();
        sendPoint.close();
        return null;
    }

    @Execute(validator = false)
	public String lightBox() {
        return "lightBox.jsp";
	}

    @Execute(input="error.jsp")
	public String inputCheck() {
    	List<String> lstKbn = new ArrayList<String>();

    	lstKbn.add("1");
    	lstKbn.add("2");
    	lstKbn.add("3");

    	if(!lstKbn.contains(k01form.infoKbn))
    	{
	       ActionMessages messages = new ActionMessages();
	       messages.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage("errors.invalid","小坂田入力値")); // xxxxxxはメッセージリソースに定義
	        ActionMessagesUtil.addMessages(request, messages);

//            //チェックNG
////            retValue.add(ActionMessages.GLOBAL_MESSAGE,
////                new ActionMessage("errors.invalid","untyara"));
//    		retValue.add(ActionMessages.GLOBAL_MESSAGE,
//    				new ActionMessage("abc間違えたね"));
//
//    		saveMessages(request, messages);
    	}

        return "error.jsp";
	}

}
