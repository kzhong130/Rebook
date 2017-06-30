package dao.impl;

import java.util.List;
import model.BuyOrderCommentRecord;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import dao.BuyOrderCommentRecordDao;

public class BuyOrderCommentRecordDaoImpl extends HibernateDaoSupport implements BuyOrderCommentRecordDao{
	public Integer save(BuyOrderCommentRecord buyOrderCommentRecord){
		return (Integer)getHibernateTemplate().save(buyOrderCommentRecord);
	}
	
	public void delete(BuyOrderCommentRecord buyOrderCommentRecord){
		getHibernateTemplate().delete(buyOrderCommentRecord);
	}
	
	public void update(BuyOrderCommentRecord buyOrderCommentRecord){
		getHibernateTemplate().merge(buyOrderCommentRecord);
	}
	
	public BuyOrderCommentRecord getBuyOrderCommentRecordByID(int ID){
		@SuppressWarnings("unchecked")
		List<BuyOrderCommentRecord> buyOrderCommentRecords = (List<BuyOrderCommentRecord>)getHibernateTemplate().find("from BuyOrderCommentRecord as b where b.ID = ?",ID);
		BuyOrderCommentRecord buyOrderCommentRecord = buyOrderCommentRecords.size() > 0 ? buyOrderCommentRecords.get(0) : null;
		return buyOrderCommentRecord;
	}
	
	public List<BuyOrderCommentRecord> getAllBuyOrderCommentRecords(){
		@SuppressWarnings("unchecked")
		List<BuyOrderCommentRecord> buyOrderCommentRecords = (List<BuyOrderCommentRecord>)getHibernateTemplate().find("from BuyOrderCommentRecord");
		return buyOrderCommentRecords;
	}
	
	public List<BuyOrderCommentRecord> getBuyOrderCommentRecordsByBuyID(int buyID){
		@SuppressWarnings("unchecked")
		List<BuyOrderCommentRecord> buyOrderCommentRecords = (List<BuyOrderCommentRecord>)getHibernateTemplate().find("from BuyOrderCommentRecord as b where b.buyID = ?",buyID);
		return buyOrderCommentRecords;
	}
	
	public List<BuyOrderCommentRecord> getBuyOrderCommentRecordsByCommenterID(int commenterID){
		@SuppressWarnings("unchecked")
		List<BuyOrderCommentRecord> buyOrderCommentRecords = (List<BuyOrderCommentRecord>)getHibernateTemplate().find("from BuyOrderCommentRecord as b where b.commenterID = ?",commenterID);
		return buyOrderCommentRecords;
	}
}
