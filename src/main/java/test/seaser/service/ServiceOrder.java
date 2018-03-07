package test.seaser.service;

import java.util.List;

import javax.annotation.Resource;

import org.seasar.extension.jdbc.JdbcManager;
import org.seasar.framework.container.SingletonS2Container;
import org.seasar.framework.container.factory.SingletonS2ContainerFactory;
import org.seasar.framework.beans.util.*;

public class ServiceOrder {

	@Resource
	JdbcManager jdbcManager;

	public void service()
	{

    	System.out.println("Service Start");

    	/////JDBC mamager

    	List<BeanMap> results =
    		    jdbcManager
    		        .selectBySql(
    		            BeanMap.class,
    		            "select * from rao_inf")
    		        .getResultList();

    	System.out.println("Service End");
	}

}
