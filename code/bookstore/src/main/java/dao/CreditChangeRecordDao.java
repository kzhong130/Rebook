package dao;

import model.CreditChangeRecord;

import java.util.List;

public interface CreditChangeRecordDao {
	public Integer save(CreditChangeRecord creditChangeRecord);
	
	public void delete(CreditChangeRecord creditChangeRecord);
	
	public void update(CreditChangeRecord creditChangeRecord);
	
	public CreditChangeRecord getCreditChangeRecordByID(int ID);
	
	public List<CreditChangeRecord> getCreditChangeRecordByUserID(int userID);
	
	public List<CreditChangeRecord> getAllCreditChangeRecords();
}
