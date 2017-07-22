package dao.impl;

import java.util.List;
import model.BuyOrder;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import dao.BuyOrderDao;

public class BuyOrderDaoImpl  extends HibernateDaoSupport implements BuyOrderDao{
	public Integer save(BuyOrder buyOrder){
		return (Integer)getHibernateTemplate().save(buyOrder);
	}
	
	public void update(BuyOrder buyOrder){
		getHibernateTemplate().merge(buyOrder);
	}
	
	public void delete(BuyOrder buyOrder){
		getHibernateTemplate().delete(buyOrder);
	}
	
	public BuyOrder getBuyOrderByBuyID(int buyID){
		@SuppressWarnings("unchecked")
		List<BuyOrder> buyOrders = (List<BuyOrder>)getHibernateTemplate().find("from BuyOrder as b where b.buyID = ?",buyID);
		BuyOrder buyOrder = buyOrders.size() > 0 ? buyOrders.get(0) : null;
		return buyOrder;
	}
	
	public List<BuyOrder> getAllBuyOrders(){
		@SuppressWarnings("unchecked")
		List<BuyOrder> buyOrders = (List<BuyOrder>)getHibernateTemplate().find("from BuyOrder");
		return buyOrders;
	}
	
	public List<BuyOrder> getBuyOrdersByBuyerID(int buyerID){
		@SuppressWarnings("unchecked")
		List<BuyOrder> buyOrders = (List<BuyOrder>)getHibernateTemplate().find("from BuyOrder as b where b.buyerID = ?",buyerID);
		return buyOrders;
	}
	
	public List<BuyOrder> getBuyOrdersByOwnerID(int ownerID){
		@SuppressWarnings("unchecked")
		List<BuyOrder> buyOrders = (List<BuyOrder>)getHibernateTemplate().find("from BuyOrder as b where b.ownerID = ?",ownerID);
		return buyOrders;
	}
	
	public List<BuyOrder> getBuyOrderByBuyerName(String buyerName){
		@SuppressWarnings("unchecked")
		List<BuyOrder> buyOrders = (List<BuyOrder>)getHibernateTemplate().find("from BuyOrder as b where b.buyerName = ?", buyerName);
		return buyOrders;
	}
	
	public List<BuyOrder> getBuyOrderByOwnerName(String ownerName){
		@SuppressWarnings("unchecked")
		List<BuyOrder> buyOrders = (List<BuyOrder>)getHibernateTemplate().find("from BuyOrder as b where b.ownerName = ?", ownerName);
		return buyOrders;
	}
}
