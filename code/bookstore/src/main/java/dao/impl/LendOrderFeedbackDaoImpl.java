package dao.impl;

import java.util.List;
import model.LendOrderFeedback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import dao.LendOrderFeedbackDao;

public class LendOrderFeedbackDaoImpl extends HibernateDaoSupport implements LendOrderFeedbackDao{
	public Integer save(LendOrderFeedback lendOrderFeedback){
		return (Integer)getHibernateTemplate().save(lendOrderFeedback);
	}
	
	public void delete(LendOrderFeedback lendOrderFeedback){
		getHibernateTemplate().delete(lendOrderFeedback);
	}
	
	public void update(LendOrderFeedback lendOrderFeedback){
		getHibernateTemplate().merge(lendOrderFeedback);
	}
	
	public LendOrderFeedback getLendOrderFeedbackByID(int ID){
		@SuppressWarnings("unchecked")
		List<LendOrderFeedback> lendOrderFeedbacks = (List<LendOrderFeedback>)getHibernateTemplate().find("from LendOrderFeedback as b where b.ID = ?",ID);
		LendOrderFeedback lendOrderFeedback = lendOrderFeedbacks.size() > 0 ? lendOrderFeedbacks.get(0) : null;
		return lendOrderFeedback;
	}
	
	public List<LendOrderFeedback> getLendOrderFeedbackByLendID(int lendID){
		@SuppressWarnings("unchecked")
		List<LendOrderFeedback> lendOrderFeedbacks = (List<LendOrderFeedback>)getHibernateTemplate().find("from LendOrderFeedback as b where b.lendID = ?",lendID);
		return lendOrderFeedbacks;
	}
	
	public List<LendOrderFeedback> getLendOrderFeedbackByUserID(int userID){
		@SuppressWarnings("unchecked")
		List<LendOrderFeedback> lendOrderFeedbacks = (List<LendOrderFeedback>)getHibernateTemplate().find("from LendOrderFeedback as b where b.userID = ?",userID);
		return lendOrderFeedbacks;
	}
	
	public List<LendOrderFeedback> getAllLendOrderFeedbacks(){
		@SuppressWarnings("unchecked")
		List<LendOrderFeedback> lendOrderFeedbacks = (List<LendOrderFeedback>)getHibernateTemplate().find("from LendOrderFeedback");
		return lendOrderFeedbacks;
	}

}
