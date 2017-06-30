package dao;

import java.util.List;

import model.BuyOrderCommentRecord;

public interface BuyOrderCommentRecordDao {
	public Integer save(BuyOrderCommentRecord buyOrderCommentRecord);
	
	public void delete(BuyOrderCommentRecord buyOrderCommentRecord);
	
	public void update(BuyOrderCommentRecord buyOrderCommentRecord);
	
	public BuyOrderCommentRecord getBuyOrderCommentRecordByID(int ID);
	
	public List<BuyOrderCommentRecord> getAllBuyOrderCommentRecords();
	
	public List<BuyOrderCommentRecord> getBuyOrderCommentRecordsByBuyID(int buyID);
	
	public List<BuyOrderCommentRecord> getBuyOrderCommentRecordsByCommenterID(int commenterID);
}
