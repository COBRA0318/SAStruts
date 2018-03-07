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
import java.util.LinkedHashMap;
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

public class IndexAction {
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
        dto3.name="<p style=\"color: red\">大町</p>";
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

int my_doc = 1;

String strJSON = JSON.encode(k01form.empUpdateItems);

//useridデータをrequestスコープで保存
request.setAttribute("userid", "NakaOka Yo");

k01form.str2 = new String[2];
k01form.str2[0] = "on1";
k01form.str2[1] = "on2";
//k01form.str2 = null;

k01form.str3 = "Osakada";

k01form.setStringData("MyCollecton");
// 動的なラジオボタンのデータの生成
LinkedHashMap<String,String> map = new LinkedHashMap<String,String>();
map.put("01", "北海道");
map.put("02", "東北");
map.put("03", "関東");
k01form.setMapData(map);

List<Map> lstKbn = new ArrayList<Map>();

//動的なラジオボタンのデータの生成
Map<String,String> kbnMap = new LinkedHashMap<String,String>();
kbnMap.put("Kbn", "01");
kbnMap.put("Kaisu", "21");
kbnMap.put("Name","仮払");

lstKbn.add(kbnMap);

kbnMap = new LinkedHashMap<String,String>();
kbnMap.put("Kbn", "02");
kbnMap.put("Kaisu", "31");
kbnMap.put("Name","前払");

lstKbn.add(kbnMap);

k01form.setShiharaiKbnRecordList(lstKbn);

    return "index.jsp";
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

    @Execute(validator = false)
    public String parts() {

        scheduleBean destBean = new scheduleBean();
        appliInfoBean srcBean  = new appliInfoBean();

        srcBean.id ="ID001";
        srcBean.name = "名前1";
        srcBean.jobType = "J1";
        srcBean.salary = "サラリー";

        BeanUtil.copyProperties(srcBean, destBean);

System.out.println(destBean.toString());

        return "parts.jsp";
    }

    @Execute(validator = false)
    public String schedule() {

        k01form.mLstSchedule  = new ArrayList<String>();

        k01form.mLstSchedule.add("123");
//    	k01form.mLstSchedule.add("123");
//    	k01form.mLstSchedule.add("123");
//    	k01form.mLstSchedule.add("123");
//    	k01form.mLstSchedule.add("123");

        List<scheduleBean> lstScheduleBean = new ArrayList<scheduleBean>();
        scheduleBean srcBean1 = new scheduleBean();
        srcBean1.id ="ID001";
        srcBean1.name = "名前1";

        scheduleBean srcBean2 = new scheduleBean();
        srcBean2.id ="ID002";
        srcBean2.name = "名前2";

        scheduleBean srcBean3 = new scheduleBean();
        srcBean3.id ="ID003";
        srcBean3.name = "名前3";

        lstScheduleBean.add(srcBean1);
        lstScheduleBean.add(srcBean2);
        lstScheduleBean.add(srcBean3);

        scheduleBean srcBean = lstScheduleBean.get(2);
        srcBean.name = "下方明";

        srcBean3.name = "名前5";
        for(scheduleBean bean : lstScheduleBean )
        {
System.out.println("Bean氏名:" + bean.name);
        }

        DateFormat df = new SimpleDateFormat("yyyy/MM/dd hh:mm:ss");

        try {
            k01form.today     = df.parse("2014/3/18 14:15:55");
            k01form.tommorow = df.parse("2013/3/18 14:15:55");

            k01form.n1 = 2;
            k01form.n2 = 1;

            mList = new ArrayList<String>();
            mList.add("123");
            mList.add("124");

        } catch (ParseException e) {
            // TODO 自動生成された catch ブロック
            e.printStackTrace();
        }
        return "schedule2.jsp";
    }

    @Execute(validator = false)
    public String taglibTest() {
        k01form.dispPage02 = "1";
        k01form.pageNumMax = "20";
        k01form.totalDataCount = "16";



        request.setAttribute("dispPage", "255");

        List<String> list = new LinkedList<String>();
        list.add(new String("長田"));
        list.add(new String("坂本"));
        list.add(new String("浜田"));
        list.add(new String("中尾"));
        list = Arrays.asList("data1");
        request.setAttribute("list", list);
        return "taglibTest.jsp";
    }

    @Execute(validator = false)
    public String sasParts() {
        k01form.hoge = "v2";
        k01form.selCobra = "op2";

        k01form.hiddenValue = "唐橋ユミさん";
        return "sasParts.jsp";
    }

    @Execute(validator = false)
    public String sasParts2() {
//    	k01form.hoge = "v2";
//    	k01form.selCobra = "op2";
        k01form.age = 15;
        return "sasParts2.jsp";
    }

    @Execute(validator = false)
    public String doubleForm() {
        return "doubleForm.jsp";
    }

}
