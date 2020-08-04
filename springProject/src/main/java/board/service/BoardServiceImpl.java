package board.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import board.bean.BoardDTO;
import board.bean.BoardPaging;
import board.dao.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardDAO boardDAO;
	@Autowired
	private HttpSession session;
	@Autowired
	private BoardPaging boardPaging;

	@Override
	public void boardWrite(Map<String, String> map) {
		map.put("id", (String)session.getAttribute("memId"));
		map.put("name", (String)session.getAttribute("memName"));
		map.put("email", (String)session.getAttribute("memEmail"));
		
		boardDAO.boardWrite(map);
	}

	@Override
	public List<BoardDTO> getBoardList(String pg) {
		
		//1페이지당 5개씩
		int endNum = Integer.parseInt(pg)*5;
		int startNum = endNum-4;
		
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		return boardDAO.getBoardList(map);
	}

	@Override
	public int getTotalA() {
		return boardDAO.getTotalA();
	}

	@Override
	public BoardPaging boardPaging(String pg) {
		
		//총 글수
		int totalA  = boardDAO.getTotalA(); 
		boardPaging.setCurrentPage(Integer.parseInt(pg));
		boardPaging.setPageBlock(3);
		boardPaging.setPageSize(5);
		boardPaging.setTotalA(totalA);
		boardPaging.makePagingHTML();
		return boardPaging;
	}

	@Override
	public List<BoardDTO> getBoardSearch(Map<String, String> map) {
		
		//1페이지당 5개씩
		int endNum = Integer.parseInt(map.get("pg"))*5;
		int startNum = endNum-4;
		
		map.put("startNum", startNum+"");
		map.put("endNum", endNum+"");
		
		return boardDAO.getBoardSearch(map);
	}
	
	//검색에서 나오는 페이징
	@Override
	public BoardPaging boardPaging(Map<String, String> map) {
		
		//총 글수
		int totalA  = boardDAO.getBoardSearchTotalA(map); 
		
		boardPaging.setCurrentPage(Integer.parseInt(map.get("pg")));
		boardPaging.setPageBlock(3);
		boardPaging.setPageSize(5);
		boardPaging.setTotalA(totalA);
		boardPaging.makePagingHTML();
		return boardPaging;
	}

	@Override
	public BoardDTO getBoard(String seq) {
		return boardDAO.getBoard(seq);
	}

	@Override
	public void boardReply(Map<String, String> map) {
		//원글
		BoardDTO pDTO = boardDAO.getBoard(map.get("pseq"));

		//map안에 이미 있는 pseq, pg, subject, content
		map.put("id", (String)session.getAttribute("memId"));
		map.put("name", (String)session.getAttribute("memName"));
		map.put("email", (String)session.getAttribute("memEmail"));
		
		map.put("ref", pDTO.getRef()+"");//원글의 그룹번호
		map.put("lev", pDTO.getLev()+"");//원글lev
		map.put("step", pDTO.getStep()+"");//원글step
		
		boardDAO.boardReply(map);	
	}

	@Override
	public void boardModify(Map<String, Object> map) {
		boardDAO.boardModify(map);
	}

	@Override
	public void boardDelete(String seq) {
		boardDAO.boardDelete(seq);
		
	}

	@Override
	public void boardHit(String seq) {
		boardDAO.boardHit(seq);
	}
}