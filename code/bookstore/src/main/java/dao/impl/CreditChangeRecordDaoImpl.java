package dao.impl;

import java.util.List;
import model.CreditChangeRecord;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import dao.CreditChangeRecordDao;

public class CreditChangeRecordDaoImpl extends HibernateDaoSupport implements CreditChangeRecordDao{
	public Integer save(CreditChangeRecord creditChangeRecord){
		return (Integer)getHibernateTemplate().save(creditChangeRecord);
	}
	
	public void delete(CreditChangeRecord creditChangeRecord){
		getHibernateTemplate().delete(creditChangeRecord);
	}
	
	public void update(CreditChangeRecord creditChangeRecord){
		getHibernateTemplate().merge(creditChangeRecord);
	}
	
	public CreditChangeRecord getCreditChangeRecordByID(int ID){
		@SuppressWarnings("unchecked")
		List<CreditChangeRecord> creditChangeRecords = (List<CreditChangeRecord>)getHibernateTemplate().find("from CreditChangeRecord as b where b.ID = ?",ID);
		CreditChangeRecord creditChangeRecord = creditChangeRecords.size() > 0 ? creditChangeRecords.get(0) : null;
		return creditChangeRecord;
	}
	
	public List<CreditChangeRecord> getCreditChangeRecordByUserID(int userID){
		@SuppressWarnings("unchecked")
		List<CreditChangeRecord> creditChangeRecords = (List<CreditChangeRecord>)getHibernateTemplate().find("from CreditChangeRecord as b where b.userID = ?",userID);
		return creditChangeRecords;
	}
	
	public List<CreditChangeRecord> getAllCreditChangeRecords(){
		@SuppressWarnings("unchecked")
		List<CreditChangeRecord> creditChangeRecords = (List<CreditChangeRecord>)getHibernateTemplate().find("from CreditChangeRecord");
		return creditChangeRecords;
	}
}
