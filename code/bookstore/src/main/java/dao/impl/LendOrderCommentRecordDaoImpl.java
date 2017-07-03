package dao.impl;

import java.util.List;
import model.LendOrderCommentRecord;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import dao.LendOrderCommentRecordDao;

public class LendOrderCommentRecordDaoImpl extends HibernateDaoSupport implements LendOrderCommentRecordDao{
	public Integer save(LendOrderCommentRecord lendOrderCommentRecord){
		return (Integer)getHibernateTemplate().save(lendOrderCommentRecord);
	}
	
	public void update(LendOrderCommentRecord lendOrderCommentRecord){
		getHibernateTemplate().merge(lendOrderCommentRecord);
	}
	
	public void delete(LendOrderCommentRecord lendOrderCommentRecord){
		getHibernateTemplate().delete(lendOrderCommentRecord);
	}
	
	public LendOrderCommentRecord getLendOrderCommentRecordByID(int ID){
		@SuppressWarnings("unchecked")
		List<LendOrderCommentRecord> lendOrderCommentRecords = (List<LendOrderCommentRecord>)getHibernateTemplate().find("from LendOrderCommentRecord as b where b.ID = ?",ID);
		LendOrderCommentRecord lendOrderCommentRecord = lendOrderCommentRecords.size() > 0 ? lendOrderCommentRecords.get(0) : null;
		return lendOrderCommentRecord;
	}
	
	public List<LendOrderCommentRecord> getLendOrderCommentRecordByLendID(int lendID){
		@SuppressWarnings("unchecked")
		List<LendOrderCommentRecord> lendOrderCommentRecords = (List<LendOrderCommentRecord>)getHibernateTemplate().find("from LendOrderCommentRecord as b where b.lendID = ?",lendID);
		return lendOrderCommentRecords;
	}
	
	public List<LendOrderCommentRecord> getLendOrderCommentRecordByCommenterID(int commenterID){
		@SuppressWarnings("unchecked")
		List<LendOrderCommentRecord> lendOrderCommentRecords = (List<LendOrderCommentRecord>)getHibernateTemplate().find("from LendOrderCommentRecord as b where b.commenterID = ?",commenterID);
		return lendOrderCommentRecords;
	}
	
	public List<LendOrderCommentRecord> getAllLendOrderCommentRecords(){
		@SuppressWarnings("unchecked")
		List<LendOrderCommentRecord> lendOrderCommentRecords = (List<LendOrderCommentRecord>)getHibernateTemplate().find("from LendOrderCommentRecord");
		return lendOrderCommentRecords;
	}
}
