package dao;

import java.util.List;

import model.LendOrder;

public interface LendOrderDao {
	public Integer save(LendOrder lendOrder);
	
	public void update(LendOrder lendOrder);
	
	public void delete(LendOrder lendOrder);
	
	public LendOrder getLendOrderByLendID(int lendID);
	
	public List<LendOrder> getLendOrderByLenderID(int lenderID);
	
	public List<LendOrder> getLendOrderByOwnerID(int ownerID);
	
	public List<LendOrder> getAllLendOrders();
}
