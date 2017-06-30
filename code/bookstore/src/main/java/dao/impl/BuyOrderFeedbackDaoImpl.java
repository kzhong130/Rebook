package dao.impl;

import java.util.List;
import model.BuyOrderFeedback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import dao.BuyOrderFeedbackDao;

public class BuyOrderFeedbackDaoImpl extends HibernateDaoSupport implements BuyOrderFeedbackDao{
	public Integer save(BuyOrderFeedback buyOrderFeedback){
		return (Integer)getHibernateTemplate().save(buyOrderFeedback);
	}
	
	public void delete(BuyOrderFeedback buyOrderFeedback){
		getHibernateTemplate().delete(buyOrderFeedback);
	}
	
	public void update(BuyOrderFeedback buyOrderFeedback){
		getHibernateTemplate().merge(buyOrderFeedback);
	}
	
	public BuyOrderFeedback getBuyOrderFeedbackByID(int ID){
		@SuppressWarnings("unchecked")
		List<BuyOrderFeedback> buyOrderFeedbacks = (List<BuyOrderFeedback>)getHibernateTemplate().find("from BuyOrderFeedback as b where b.ID = ?",ID);
		BuyOrderFeedback buyOrderFeedback = buyOrderFeedbacks.size() > 0 ? buyOrderFeedbacks.get(0) : null;
		return buyOrderFeedback;
	}
	
	public List<BuyOrderFeedback> getBuyOrderFeedbackByUserID(int userID){
		@SuppressWarnings("unchecked")
		List<BuyOrderFeedback> buyOrderFeedbacks = (List<BuyOrderFeedback>)getHibernateTemplate().find("from BuyOrderFeedback as b where b.userID = ?",userID);
		return buyOrderFeedbacks;
	}
	
	public List<BuyOrderFeedback> getBuyOrderFeedbackByBuyID(int buyID){
		@SuppressWarnings("unchecked")
		List<BuyOrderFeedback> buyOrderFeedbacks = (List<BuyOrderFeedback>)getHibernateTemplate().find("from BuyOrderFeedback as b where b.buyID = ?",buyID);
		return buyOrderFeedbacks;
	}
	
	public List<BuyOrderFeedback> getBuyOrderFeedbackByAdminID(int adminID){
		@SuppressWarnings("unchecked")
		List<BuyOrderFeedback> buyOrderFeedbacks = (List<BuyOrderFeedback>)getHibernateTemplate().find("from BuyOrderFeedback as b where b.adminID = ?",adminID);
		return buyOrderFeedbacks;
	}
	
	public List<BuyOrderFeedback> getAllBuyOrderFeedbacks(){
		@SuppressWarnings("unchecked")
		List<BuyOrderFeedback> buyOrderFeedbacks = (List<BuyOrderFeedback>)getHibernateTemplate().find("from BuyOrderFeedback");
		return buyOrderFeedbacks;
	}
}
