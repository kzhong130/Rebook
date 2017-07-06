package dao;

import model.CreditChangeRecord;

import java.util.List;

public interface CreditChangeRecordDao {
	public Integer save(CreditChangeRecord creditChangeRecord);
	
	public void delete(CreditChangeRecord creditChangeRecord);
	
	public void update(CreditChangeRecord creditChangeRecord);
	
	public CreditChangeRecord getCreditChangeRecordByID(int ID);
	
	public List<CreditChangeRecord> getCreditChangeRecordByUserName(String userName);
	
	public List<CreditChangeRecord> getAllCreditChangeRecords();
}
