package test.seaser.util;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

public class HeaderTag extends TagSupport {

    private String name;

    @Override
    public int doEndTag() throws JspException {
        try {
            // 出力
            pageContext.getOut().print("あなたが入力した名前は「" + name + "」です。");
            HttpSession session = pageContext.getSession();


            String strKanriNo = (String)session.getAttribute("strKanriNo");

            int i = Integer.parseInt("2-");
        } catch (IOException ex) {
            Logger.getLogger(HeaderTag.class.getName()).log(Level.SEVERE, null, ex);
        }
        // 残りのページを評価する値を返して終了
        return EVAL_PAGE;
    }

    // name属性をセットするためのセッタ
    public void setName(String name) {
        this.name = name;
    }

}