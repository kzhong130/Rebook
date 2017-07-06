package dao;

import java.util.List;

import model.CoinChangeRecord;

public interface CoinChangeRecordDao {
	public Integer save(CoinChangeRecord coinChangeRecord);
	
	public void update(CoinChangeRecord coinChangeRecord);
	
	public void delete(CoinChangeRecord coinChangeRecord);
	
	public CoinChangeRecord getCoinChangeRecordByID(int ID);
	
	public List<CoinChangeRecord> getAllCoinChangeRecords();
	
	public List<CoinChangeRecord> getCoinChangeRecordByUserName(String userName);
}
