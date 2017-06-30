package dao.impl;

import java.util.List;
import model.LendOrder;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import dao.LendOrderDao;

public class LendOrderDaoImpl extends HibernateDaoSupport implements LendOrderDao{
	public Integer save(LendOrder lendOrder){
		return (Integer)getHibernateTemplate().save(lendOrder);
	}
	
	public void update(LendOrder lendOrder){
		getHibernateTemplate().merge(lendOrder);
	}
	
	public void delete(LendOrder lendOrder){
		getHibernateTemplate().delete(lendOrder);
	}
	
	public LendOrder getLendOrderByLendID(int lendID){
		@SuppressWarnings("unchecked")
		List<LendOrder> lendOrders = (List<LendOrder>)getHibernateTemplate().find("from LendOrder as b where b.lendID = ?",lendID);
		LendOrder lendOrder = lendOrders.size() > 0 ? lendOrders.get(0) : null;
		return lendOrder;
	}
	
	public List<LendOrder> getLendOrderByLenderID(int lenderID){
		@SuppressWarnings("unchecked")
		List<LendOrder> lendOrders = (List<LendOrder>)getHibernateTemplate().find("from LendOrder as b where b.lenderID = ?",lenderID);
		return lendOrders;
	}
	
	public List<LendOrder> getLendOrderByOwnerID(int ownerID){
		@SuppressWarnings("unchecked")
		List<LendOrder> lendOrders = (List<LendOrder>)getHibernateTemplate().find("from LendOrder as b where b.ownerID = ?",ownerID);
		return lendOrders;
	}
	
	public List<LendOrder> getAllLendOrders(){
		@SuppressWarnings("unchecked")
		List<LendOrder> lendOrders = (List<LendOrder>)getHibernateTemplate().find("from LendOrder");
		return lendOrders;
	}
}
