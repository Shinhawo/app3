package dao;

import java.util.List;

import util.DaoHelper;
import vo.Board;
import vo.Comment;
import vo.Customer;

public class commentDao {
	
	public void insertComment(Comment comment) {
		
		DaoHelper.update("commentDao.insertComment", comment.getContent(),
													 comment.getCustomer().getId(),
													 comment.getBoard().getNo());
	}
	
	public List<Comment> getCommentsByBoardNo (int boardNo){
		
		return DaoHelper.selectList("commentDao.getCommentsByBoardNo", rs -> {
			Comment comment = new Comment();
			comment.setNo(rs.getInt("comment_no"));
			comment.setContent(rs.getString("comment_content"));
			comment.setCreateDate(rs.getDate("comment_create_date"));
			
			Customer customer = new Customer();
			customer.setId(rs.getString("cust_id"));
			customer.setName(rs.getString("cust_name"));
			
			comment.setCustomer(customer);
			
			return comment;
		}, boardNo);
	}


	public Comment getCommentByNo(int commentNo) {
		
		return DaoHelper.selectOne("commentDao.getCommentByNo", rs -> {
			Comment comment = new Comment();
			comment.setNo(rs.getInt("comment_no"));
			comment.setContent(rs.getString("comment_content"));
			comment.setCreateDate(rs.getDate("comment_create_date"));
			
			Customer customer = new Customer();
			Board board = new Board();
			customer.setId(rs.getString("cust_id"));
			board.setNo(rs.getInt("board_no"));
			
			comment.setCustomer(customer);
			comment.setBoard(board);
			
			return comment;
		}, commentNo);
	}
	
	public void deleteCommentByNo(int commentNo) {
		DaoHelper.update("commentDao.deleteCommentBYNo", commentNo);
	}

}
