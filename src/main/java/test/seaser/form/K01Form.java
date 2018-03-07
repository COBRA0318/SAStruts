package test.seaser.form;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.seasar.struts.annotation.Minbytelength;
import org.seasar.struts.annotation.Minlength;

import test.seaser.dto.EmployeeDto;

public class K01Form extends ActionForm {

	public Integer deptId;

	private static final long serialVersionUID = 1L;

	private String[] question2;

	private String strParam01;

	private String continuePro1;

	private String continuePro2;


	private String continuePro3;

	private String continuePro4;

	public String question3;

	public String[] shops=new String[3];

	public String[] cars=new String[3];

	public List<Map> shiharaiKbnRecordList;

    public List<Map> getShiharaiKbnRecordList() {
		return shiharaiKbnRecordList;
	}

	public void setShiharaiKbnRecordList(List<Map> shiharaiKbnRecordList) {
		this.shiharaiKbnRecordList = shiharaiKbnRecordList;
	}

	//複数Employee情報格納用
    public List<EmployeeDto> empUpdateItems;

    //複数Employee情報格納用
    public List<EmployeeDto> empDest;

    public String stringData;

    public LinkedHashMap<String,String> mapData;

	public String getStringData() {
		return stringData;
	}

	public void setStringData(String stringData) {
		this.stringData = stringData;
	}

	public LinkedHashMap<String, String> getMapData() {
		return mapData;
	}

	public void setMapData(LinkedHashMap<String, String> mapData) {
		this.mapData = mapData;
	}

	public String[] str2;

	public String str3;


	public String url1;

	public String url2;

	public String innerText1;

	public String[] strArr4;

	public List<String> mLstSchedule;

	public Date today;

	public Date tommorow;

	public int n1;
	public int n2;

	public final String msgDaijyobu = "マリィにお任せもう大丈夫";

	public String hoge;

// タグ保持用
	public String dispPage02;
	public String pageNumMax;
	public String totalDataCount;

	public String selCobra;

	public String hiddenValue;

	public int age;

//    public String getHoge() {
//		return hoge;
//	}
//
//	public void setHoge(String hoge) {
//		this.hoge = hoge;
//	}

	public List<String> getmLstSchedule() {
		return mLstSchedule;
	}

	public void setmLstSchedule(List<String> mLstSchedule) {
		this.mLstSchedule = mLstSchedule;
	}

	public String getStr3() {
		return str3;
	}

	public void setStr3(String str3) {
		this.str3 = str3;
	}

	public Map<String,String> request1 = new HashMap<String,String>();


    public List<EmployeeDto> getEmpUpdateItems() {
		return empUpdateItems;
	}

	public void setEmpUpdateItems(List<EmployeeDto> empUpdateItems) {
		this.empUpdateItems = empUpdateItems;
	}

	/////////<JSON項目>//////////////////
	//情報取得元区分
	//@Minlength(minlength=2)
	public String infoKbn;

	//リクエスト1
	public List<String> request;

    //複数Employee情報格納用
    public List<EmployeeDto> empCheckedItems;

////////<JSON項目>//////////////////


	public Integer getDeptId() {
		return deptId;
	}

	public void setDeptId(Integer deptId) {
		this.deptId = deptId;
	}

	public String[] getQuestion2() {
		return question2;
	}

	public void setQuestion2(String[] question2) {
		this.question2 = question2;
	}

	public String getStrParam01() {
		return strParam01;
	}

	public void setStrParam01(String strParam01) {
		this.strParam01 = strParam01;
	}

	public String getContinuePro1() {
		return continuePro1;
	}

	public void setContinuePro1(String continuePro1) {
		this.continuePro1 = continuePro1;
	}

	public String getContinuePro2() {
		return continuePro2;
	}

	public void setContinuePro2(String continuePro2) {
		this.continuePro2 = continuePro2;
	}

	public String getContinuePro3() {
		return continuePro3;
	}

	public void setContinuePro3(String continuePro3) {
		this.continuePro3 = continuePro3;
	}

	public String getContinuePro4() {
		return continuePro4;
	}

	public void setContinuePro4(String continuePro4) {
		this.continuePro4 = continuePro4;
	}

	public String getQuestion3() {
		return question3;
	}

	public void setQuestion3(String question3) {
		this.question3 = question3;
	}

	public void setShops(int index, String value){
		    shops[index]=value;
	}

	public String getShops(int index){
	    return(shops[index]);
	}

	public String getCars(int index, String value) {
		return (cars[index]);
	}

	public void setCars(int index, String value) {
		this.cars[index] = value;
	}

	public String getInfoKbn() {
		return infoKbn;
	}

	public void setInfoKbn(String infoKbn) {
		this.infoKbn = infoKbn;
	}

	public List<EmployeeDto> getEmpCheckedItems() {
		return empCheckedItems;
	}

	public void setEmpCheckedItems(List<EmployeeDto> empCheckedItems) {
		this.empCheckedItems = empCheckedItems;
	}

	public String[] getStr2() {
		return str2;
	}

	public void setStr2(String[] str2) {
		this.str2 = str2;
	}

	public String getUrl1() {
		return url1;
	}

	public void setUrl1(String url1) {
		this.url1 = url1;
	}

	public String getUrl2() {
		return url2;
	}

	public void setUrl2(String url2) {
		this.url2 = url2;
	}

	public String getInnerText1() {
		return innerText1;
	}

	public void setInnerText1(String innerText1) {
		this.innerText1 = innerText1;
	}

    /**
     * パラメータの論理的整合性チェック
     */
//    public ActionMessages checkHoge() {
//        ActionMessages retValue = new ActionMessages();
//
//    	List<String> lstKbn = new ArrayList<String>();
//
//    	lstKbn.add("1");
//    	lstKbn.add("2");
//    	lstKbn.add("3");
//
//    	if(!lstKbn.contains(this.infoKbn))
//    	{
//
//            //チェックNG
////            retValue.add(ActionMessages.GLOBAL_MESSAGE,
////                new ActionMessage("errors.invalid","untyara"));
//    		retValue.add(ActionMessages.GLOBAL_MESSAGE,
//    				new ActionMessage("abc間違えたね"));
//
//    		saveMessages(request, messages);
//    	}
//
//        return retValue;
//    }


}
