package dao;

import java.util.List;

import model.LendOrderFeedback;

public interface LendOrderFeedbackDao {

	public Integer save(LendOrderFeedback lendOrderFeedback);
	
	public void delete(LendOrderFeedback lendOrderFeedback);
	
	public void update(LendOrderFeedback lendOrderFeedback);
	
	public LendOrderFeedback getLendOrderFeedbackByID(int ID);
	
	public List<LendOrderFeedback> getLendOrderFeedbackByLendID(int lendID);
	
	public List<LendOrderFeedback> getLendOrderFeedbackByUserID(int userID);
	
	public List<LendOrderFeedback> getAllLendOrderFeedbacks();
}
