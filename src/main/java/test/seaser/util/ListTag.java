package test.seaser.util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.TreeSet;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.IterationTag;
import javax.servlet.jsp.tagext.Tag;

public class ListTag implements IterationTag {

	private PageContext pageContext=null;
	private Tag parent=null;
	private Iterator iterator=null;
	private String item="";

	// 表示ページ数
	private int dispPage = 0;
	// 1ページ毎の表示件数
	private double pageNumMax = 0;
	// 検索結果総件数
	private double totalDataCount = 0;

	List<String> pageNumberList = new ArrayList<String>();

	// 総ページ数
	private int totalPageCount = 0;


	// 表示ペース数
	public void setDispPage(String page)
	{
		this.dispPage = Integer.parseInt(page);
	}

	// 1ページの表示数
	public void setPageNumMax(String count)
	{
		this.pageNumMax  = Double.parseDouble(count);
	}

	// 総データ数
	public void setTotalDataCount(String count)
	{
		this.totalDataCount  = Double.parseDouble(count);
	}

	public void setList(String name){
//	    List list=(List)pageContext.findAttribute(name);
//
//	    if(list!= null){
//	    	this.dataCount = list.size();
//		}
	}

	/**
	 * itemを設定します。
	 * @param item item
	 */
	public void setItem(String item){
		this.item=item;
	}

	@Override
	public int doStartTag() throws JspException {
	  // TODO 自動生成されたメソッド・スタブ
//	  if(iterator.hasNext()){
		  try
		  {
			  //総ページ数を設定
			  totalPageCount = (int)Math.ceil(totalDataCount / pageNumMax);

			  //1ページのみの場合
			  if(totalPageCount <= 1)
			  {
				  StringBuffer sb1 = new StringBuffer();
				  sb1.append("<DIV>検索結果は0件です\r\n");
				  sb1.append("</DIV>\r\n");
				  pageContext.getOut().print(sb1.toString());
				  return(SKIP_BODY);
			  }

			  pageContext.getOut().println("<DIV class=\"boxWrapper\">");

		    	pageContext.getOut().print("<DIV class=\"L1\">");
		    	if(dispPage != 1 ){
			    	pageContext.getOut().print("<input type=\"hidden\" name=\"L1Page\" value=\"" +
			    			String.valueOf(1) + "\">" );
		    	}
		    	pageContext.getOut().println("</DIV>");

		    	pageContext.getOut().print("<DIV class=\"L2\">");
		    	if(dispPage != 1 ){
			    	pageContext.getOut().print("<input type=\"hidden\" name=\"L2Page\" value=\"" +
			    			String.valueOf(dispPage - 1) +"\">" );
		    	}
		    	pageContext.getOut().println("</DIV>");


			  pageNumberList = createPages(dispPage, totalPageCount);

			  this.iterator = pageNumberList.iterator();

			  String nextPage = (String)iterator.next();

		  	  //表示ページの場合
			  if(dispPage == Integer.parseInt(nextPage)){
				  pageContext.getOut().print("<DIV class=\"normal selected\">");
			  }else{
				  pageContext.getOut().print("<DIV class=\"normal\">");
			  }

			  pageContext.getOut().print(nextPage);

	          pageContext.getOut().println("</DIV>");

	          return(EVAL_BODY_INCLUDE);
    	  }catch(IOException e){
    		  throw new JspException(e.getMessage());
    	  }

//      }else{
//        return(SKIP_BODY);
//      }
	}

	@Override
	public int doAfterBody() throws JspException {
		// TODO 自動生成されたメソッド・スタブ
	    if(iterator.hasNext()){
	        try
	        {
	          String nextPage = (String)iterator.next();

		  	  //表示ページの場合
			  if(dispPage == Integer.parseInt(nextPage)){
				  pageContext.getOut().print("<DIV class=\"normal selected\">");
			  }else{
				  pageContext.getOut().print("<DIV class=\"normal\">");
			  }

			  pageContext.getOut().print(nextPage);
			  pageContext.getOut().println("</DIV>");

	    	}catch(IOException e){
	    		throw new JspException(e.getMessage());
	    	}
	        return(EVAL_BODY_AGAIN);
	     }else{
	        return(SKIP_BODY);
	     }
	}

	@Override
	public int doEndTag() throws JspException{
		// TODO 自動生成されたメソッド・スタブ
		try
		{
		    if(this.totalPageCount > 0){

		    	pageContext.getOut().print("<DIV class=\"R1\">");
		    	if(dispPage != totalPageCount ){
			    	pageContext.getOut().print("<input type=\"hidden\" name=\"R1Page\" value=\"" +
			    			String.valueOf(dispPage + 1) + "\">" );
		    	}
		    	pageContext.getOut().println("</DIV>");

		    	pageContext.getOut().print("<DIV class=\"R2\">");
		    	if(dispPage != totalPageCount ){
			    	pageContext.getOut().print("<input type=\"hidden\" name=\"R2Page\" value=\"" +
			    			String.valueOf(totalPageCount + 1) +"\">" );
		    	}
		    	pageContext.getOut().println("</DIV>");

		    	//ページリンク親タグ
		    	pageContext.getOut().println("</DIV>");
		    }
		}catch(IOException e){
			throw new JspException(e.getMessage());
		}
	    return (EVAL_PAGE);
	}

	/**
	 * parentを取得します。
	 * @return parent
	 */
	@Override
	public Tag getParent() {
		// TODO 自動生成されたメソッド・スタブ
	      return parent;
	}

	@Override
	public void release() {
		// TODO 自動生成されたメソッド・スタブ

	}

	/**
	 * pageContextを設定します。
	 * @param pageContext pageContext
	 */
	@Override
	public void setPageContext(PageContext pageContext) {
		// TODO 自動生成されたメソッド・スタブ
	     this.pageContext = pageContext;
	
	}

	/**
	 * parentを設定します。
	 * @param parent parent
	 */
	@Override
	public void setParent(Tag parent) {
		// TODO 自動生成されたメソッド・スタブ
	       this.parent = parent;
	}

	private List<String>createPages(int nDispPage, int nTotalPage)
	{
		// 左部の使用可能ページ番号数（最大4ページ)
		int nLeftEnable = 0;
		// 右部の使用可能ページ番号数（最大4ページ)
		int nRightEnable = 0;

		List<String> pageNumList = new ArrayList<String>();

		// 左部使用可能ページ数を判定
		for(int i = nDispPage - 1; i >= nDispPage - 4; i--)
		{
			//先頭ページに到達した場合、終了
			if(i < 1){
				break;
			}
			nLeftEnable++;
		}

		// 右部使用可能ページ数を判定（最大4ページ)
		for(int i = nDispPage + 1; i <= nDispPage + 4;i++)
		{
			//最終ページに到達した場合、終了
			if(i > nTotalPage){
				break;
			}
			nRightEnable++;
		}

		//左部不足ページ数
		int nLeftShortPages  = 2 - nLeftEnable;

		//右部不足ページ数
		int nRightShortPages  = 2 - nRightEnable;


		//左部不足ページ数が0以下の場合(=不足ページ無し)
		if(nLeftShortPages <= 0){
			nLeftShortPages = 0;
		}

		//右部不足ページ数が0以下の場合(=不足ページ無し)
		if(nRightShortPages <= 0){
			nRightShortPages = 0;
		}

		TreeSet<Integer> leftSet = new TreeSet<Integer>();
		// 左部ページ(+右部ページ不足分)を追加
		for(int i=0; i < 2 + nRightShortPages; i++)
		{
			if( i > nLeftEnable - 1 ){
				break;
			}

			leftSet.add(nDispPage - 1 - i);
		}

		TreeSet<Integer> rightSet = new TreeSet<Integer>();
		// 右部ページ(+左部ページ不足分)を追加
		for(int i=0; i < 2 +nLeftShortPages; i++)
		{
			if( i > nRightEnable - 1 ){
				break;
			}

			rightSet.add(nDispPage + 1 + i);
		}

		for(Integer obj: leftSet)
		{
			pageNumList.add(String.valueOf(obj));
		}

		pageNumList.add(String.valueOf(dispPage));

		for(Object obj: rightSet)
		{
			pageNumList.add(String.valueOf(obj));
		}

		return pageNumList;
	}

}
