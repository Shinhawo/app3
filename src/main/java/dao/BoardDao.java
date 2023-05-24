package dao;

import java.util.List;

import util.DaoHelper;
import vo.Board;
import vo.Customer;

public class BoardDao {
	
	public void insertBoard(Board board) {
		DaoHelper.update("boardDao.insertBoard", board.getTitle(),
												 board.getContent(),
												 board.getCustomer().getId());
	}
	
	public List<Board> getBoards(int begin, int end){
		
		return DaoHelper.selectList("boardDao.getBoards", rs -> {
			Board board = new Board();
			// 번호 제목 작성자 리뷰갯수 등록일
			board.setNo(rs.getInt("board_no"));
			board.setTitle(rs.getString("board_title"));
			board.setCommentCnt(rs.getInt("board_comment_cnt"));
			board.setCreateDate(rs.getDate("board_create_date"));
			
			Customer customer = new Customer();
			customer.setId(rs.getString("cust_id"));
			customer.setName(rs.getString("cust_name"));
			board.setCustomer(customer);
			
			return board;
		}, begin, end);
	}
	
	public Board getBoardByNo(int no) {
		
		return DaoHelper.selectOne("boardDao.getBoardByNo", rs -> {
			Board board = new Board();
			board.setNo(rs.getInt("board_no"));
			board.setTitle(rs.getString("board_title"));
			board.setCommentCnt(rs.getInt("board_comment_cnt"));
			board.setCreateDate(rs.getDate("board_create_date"));
			board.setReadCnt(rs.getInt("board_read_cnt"));
			board.setUpdateDate(rs.getDate("board_update_date"));
			board.setDeleted(rs.getString("board_deleted"));
			board.setContent(rs.getString("board_content"));
			
			
			Customer customer = new Customer();
			customer.setId(rs.getString("cust_id"));
			customer.setName(rs.getString("cust_name"));
			board.setCustomer(customer);
			
			return board;
		}, no);
	}
	
	public int getTotalRows() {
		return DaoHelper.selectOne("boardDao.getTotalRows", rs -> {
			return rs.getInt("cnt");
		});
		
	}
}
