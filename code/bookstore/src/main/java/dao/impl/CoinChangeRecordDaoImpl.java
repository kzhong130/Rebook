package dao.impl;

import java.util.List;
import model.CoinChangeRecord;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import dao.CoinChangeRecordDao;

public class CoinChangeRecordDaoImpl extends HibernateDaoSupport implements CoinChangeRecordDao{
	public Integer save(CoinChangeRecord coinChangeRecord){
		return (Integer)getHibernateTemplate().save(coinChangeRecord);
	}
	
	public void update(CoinChangeRecord coinChangeRecord){
		getHibernateTemplate().merge(coinChangeRecord);
	}
	
	public void delete(CoinChangeRecord coinChangeRecord){
		getHibernateTemplate().delete(coinChangeRecord);
	}
	
	public CoinChangeRecord getCoinChangeRecordByID(int ID){
		@SuppressWarnings("unchecked")
		List<CoinChangeRecord> coinChangeRecords = getHibernateTemplate().find("from CoinChangeRecord as b where b.ID = ?", ID);
		CoinChangeRecord coinChangeRecord = coinChangeRecords.size() > 0 ? coinChangeRecords.get(0) : null;
		return coinChangeRecord;
	}
	
	public List<CoinChangeRecord> getAllCoinChangeRecords(){
		@SuppressWarnings("unchecked")
		List<CoinChangeRecord> coinChangeRecords = getHibernateTemplate().find("from CoinChangeRecord");
		return coinChangeRecords;
	}
	
	public List<CoinChangeRecord> getCoinChangeRecordByUserName(String userName){
		@SuppressWarnings("unchecked")
		List<CoinChangeRecord> coinChangeRecords = getHibernateTemplate().find("from CoinChangeRecord as b where b.userName = ? order by b.time",userName);
		return coinChangeRecords;
	}
}
