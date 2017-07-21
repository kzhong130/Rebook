package dao;

import java.util.List;

import model.BuyOrder;

public interface BuyOrderDao {
	public Integer save(BuyOrder buyOrder);
	
	public void delete(BuyOrder buyOrder);
	
	public void update(BuyOrder buyOrder);
	
	public BuyOrder getBuyOrderByBuyID(int buyID);
	
	public List<BuyOrder> getAllBuyOrders();
	
	public List<BuyOrder> getBuyOrdersByBuyerID(int buyerID);
	
	public List<BuyOrder> getBuyOrdersByOwnerID(int ownerID);
	
	public List<BuyOrder> getBuyOrderByBuyerName(String buyerName);
	
}
