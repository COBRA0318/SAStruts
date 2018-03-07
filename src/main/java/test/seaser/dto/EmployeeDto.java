package test.seaser.dto;

import java.io.Serializable;
import java.util.*;

public class EmployeeDto implements Serializable {

    private static final long serialVersionUID = 1L;

    public boolean update_check;

    public String id;

    public String name;

    public String jobType;

    public String salary;


    public String departmentId;

    public List<Integer> gaiziStyleIns = new ArrayList<Integer>();
}
