package wfu.hyg.pojo;

public class OrderBean {
    private Integer id;

    private Integer orderid;

    private String money;

    private Integer user;

    private String state;

    private String orderdate; 
    
    private String isCash;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getOrderid() {
        return orderid;
    }

    public void setOrderid(Integer orderid) {
        this.orderid = orderid;
    }

    public String getMoney() {
        return money;
    }

    public void setMoney(String money) {
        this.money = money == null ? null : money.trim();
    }


    public Integer getUser() {
		return user;
	}

	public void setUser(Integer user) {
		this.user = user;
	}

	public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state == null ? null : state.trim();
    }

    public String getOrderdate() {
        return orderdate;
    }

    public void setOrderdate(String orderdate) {
        this.orderdate = orderdate == null ? null : orderdate.trim();
    }
    
	public String getIsCash() {
		return isCash;
	}

	public void setIsCash(String isCash) {
		this.isCash = isCash;
	}

	public OrderBean() {
		super();
	}

	public OrderBean(Integer orderid, String money, String state,
			String orderdate , Integer user , String isCash) {
		super();
		this.orderid = orderid;
		this.money = money;
		this.state = state;
		this.orderdate = orderdate;
		this.user = user ;
		this.isCash = isCash;
	}
    
    
}