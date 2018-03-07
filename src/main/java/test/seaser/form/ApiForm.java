package test.seaser.form;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts.action.ActionForm;
import org.seasar.struts.annotation.Minbytelength;
import org.seasar.struts.annotation.Minlength;

import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
//import hoge.util.PropertyResourcesUtil;

public class ApiForm extends ActionForm {

	public Integer deptId;

	public String schCd;

	public String InfoKbn;

	public Integer pagePCnt;

	private static final long serialVersionUID = 1L;

    /**
     * パラメータの論理的整合性チェック
     */
    public ActionMessages checkHoge() {
        ActionMessages retValue = new ActionMessages();

    	List<String> lstKbn = new ArrayList<String>();

    	lstKbn.add("1");
    	lstKbn.add("2");
    	lstKbn.add("3");

    	if(!lstKbn.contains(this.InfoKbn))
    	{
            //チェックNG
//            retValue.add(ActionMessages.GLOBAL_MESSAGE,
//                new ActionMessage("errors.invalid","untyara"));

            new ActionMessage("abc間違えたね");
    	}

        return retValue;
    }
}
