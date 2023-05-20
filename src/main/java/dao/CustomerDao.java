package dao;



import java.util.List;

import VO.Customer;
import util.DaoHelper;

public class CustomerDao {
	
	public void insertCustomer(Customer customer) {
		
		DaoHelper.update("customerDao.insertCustomer", customer.getId(), customer.getPassword(),
								customer.getName(), customer.getTel(), customer.getEmail());
	}
	
	public List<Customer> getAllCustomers() {
		
		return DaoHelper.selectList("customerDao.getAllCustomers", rs -> {
			Customer customer = new Customer();
			customer.setId(rs.getString("cust_id"));
			customer.setName(rs.getString("cust_name"));
			customer.setTel(rs.getString("cust_tel"));
			customer.setEmail(rs.getString("cust_email"));
			customer.setDisabled(rs.getString("cust_disabled"));

			return customer;
		});
	}
	
	public void updateCustDisabled(String id) {
		
		DaoHelper.update("customerDao.updateCustDisabled", id);
	}
	
	
	public void updateCustEnable(String id) {
		
		DaoHelper.update("customerDao.updateCustEnable", id);
	}
	
	
	public Customer getCustomerById(String id) {
		
		return DaoHelper.selectOne("customerDao.getCustomerById", rs -> {
			Customer customer = new Customer();
			customer.setId(rs.getString("cust_id"));
			customer.setName(rs.getString("cust_name"));
			customer.setTel(rs.getString("cust_tel"));
			customer.setEmail(rs.getString("cust_email"));
			customer.setDisabled(rs.getString("cust_disabled"));
			customer.setPoint(rs.getInt("cust_point"));
			customer.setCreate_Date(rs.getDate("cust_create_date"));
			customer.setUpdate_Date(rs.getDate("cust_update_date"));
			
			
			return customer;
		}, id);
	}
	
	public void deleteCustomerById(String id) {
		
		DaoHelper.update("CustomerDao.deleteCustomerById", id);
	}
}
