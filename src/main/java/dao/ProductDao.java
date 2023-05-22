package dao;

import java.util.List;

import VO.Category;
import VO.Product;
import util.DaoHelper;

public class ProductDao {
	
	/**
	 * 전체 상품목록을 반환한다.
	 * @return 전체 상품 목록
	 */
	public List<Product> getProducts() {
		
		return DaoHelper.selectList("productDao.getProducts", rs -> {
			
			Product product = new Product();
			product.setNo(rs.getInt("product_no"));
			product.setName(rs.getString("product_name"));
			product.setMaker(rs.getString("product_maker"));
			product.setPrice(rs.getInt("product_price"));
			product.setDiscountPrice(rs.getInt("product_discount_price"));
			
			return product;
		});
	}
	
	/**
	 * 새 상품정보를 전달받아서 테이블에 저장한다.
	 * @param product 새 상품정보가 포함된 Product객체
	 */
	public void insertProduct(Product product) {
		
		DaoHelper.update("productDao.insertProduct", product.getName(),product.getMaker(),
													 product.getDesciption(), product.getPrice(),
													 product.getDiscountPrice(), product.getStock(), 
													 product.getCategory().getNo());
	}
	
	/**
	 * 전달받은 상품번호에 해당하는 상품정보를 조회해서 반환한다.
	 * @param no 조회할 상품의 번호
	 * @return 상품정보
	 */
	public Product getProductByNo(int no) {
		return DaoHelper.selectOne("productDao.getProductByNo", rs -> {
			Product product = new Product();
			
			product.setNo(rs.getInt("product_no"));
			product.setName(rs.getString("product_name"));
			product.setMaker(rs.getString("product_maker"));
			product.setPrice(rs.getInt("product_price"));
			product.setDiscountPrice(rs.getInt("product_discount_price"));
			product.setDesciption(rs.getString("product_description"));
			product.setOnSell(rs.getString("product_on_sell"));
			product.setStock(rs.getInt("product_stock"));
			product.setCreateDate(rs.getDate("product_create_date"));
			product.setUpdateDate(rs.getDate("product_update_date"));
			
			Category cat = new Category();
			cat.setNo(rs.getInt("cat_no"));
			cat.setName(rs.getString("cat_name"));
			product.setCategory(cat);
			
			return product;
		}, no);
	}
	
	
	public void updateProduct(Product product) {
		
		DaoHelper.update("productDao.updateProduct", product.getName(), product.getMaker(),
													 product.getDesciption(), product.getPrice(),
													 product.getDiscountPrice(), product.getOnSell(),
													 product.getStock(), product.getCategory().getNo(),
													 product.getNo());
	}
	
	
	/**
	 * 전달받은 상품정보에 해당하는 상품정보를 삭제한다.
	 * @param no 삭제할 상품번호
	 */
	public void deleteProductByNo(int no) {
		
		DaoHelper.update("productDao.deleteProductByNo", no);
	}
}
