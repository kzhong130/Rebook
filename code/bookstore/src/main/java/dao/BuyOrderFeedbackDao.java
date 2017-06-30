package dao;

import java.util.List;

import model.BuyOrderFeedback;

public interface BuyOrderFeedbackDao {
	public Integer save(BuyOrderFeedback buyOrderFeedback);
	
	public void delete(BuyOrderFeedback buyOrderFeedback);
	
	public void update(BuyOrderFeedback buyOrderFeedback);
	
	public BuyOrderFeedback getBuyOrderFeedbackByID(int ID);
	
	public List<BuyOrderFeedback> getBuyOrderFeedbackByUserID(int userID);
	
	public List<BuyOrderFeedback> getBuyOrderFeedbackByBuyID(int buyID);
	
	public List<BuyOrderFeedback> getBuyOrderFeedbackByAdminID(int adminID);
	
	public List<BuyOrderFeedback> getAllBuyOrderFeedbacks();
	
	
}
