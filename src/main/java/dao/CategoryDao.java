package dao;

import java.util.List;

import util.DaoHelper;
import vo.Category;

public class CategoryDao {
	
	public List<Category> getCategories() {
		
		return DaoHelper.selectList("CategoryDao.getCategories", rs -> {
			Category category = new Category();
			category.setNo(rs.getInt("cat_no"));
			category.setName(rs.getString("cat_name"));
			
			return category;
		});
	}
}
