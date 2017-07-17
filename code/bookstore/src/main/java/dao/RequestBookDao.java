package dao;

import java.util.List;

import model.RequestBook;

public interface RequestBookDao {

	public Integer save(RequestBook requestBook);
	
	public void delete(RequestBook requestBook);
	
	public void update(RequestBook requestBook);
	
	public List<RequestBook> getProcessedRequest(String userName);
	
	public List<RequestBook> getAllRequestBooks();
}
