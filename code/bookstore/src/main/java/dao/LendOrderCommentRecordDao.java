package dao;

import java.util.List;

import model.LendOrderCommentRecord;

public interface LendOrderCommentRecordDao {
	public Integer save(LendOrderCommentRecord lendOrderCommentRecord);
	
	public void update(LendOrderCommentRecord lendOrderCommentRecord);
	
	public void delete(LendOrderCommentRecord lendOrderCommentRecord);
	
	public LendOrderCommentRecord getLendOrderCommentRecordByID(int ID);
	
	public List<LendOrderCommentRecord> getLendOrderCommentRecordByLendID(int lendID);
	
	public List<LendOrderCommentRecord> getLendOrderCommentRecordByCommenterID(int commenterID);
	
	public List<LendOrderCommentRecord> getAllLendOrderCommentRecords();
}
