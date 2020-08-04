package imageboard.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import imageboard.bean.ImageboardDTO;

@Repository
public class ImageboardDAOMybatis implements ImageboardDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void writeImageboard(ImageboardDTO imageboardDTO) {
		sqlSession.insert("imageboardSQL.writeImageboard", imageboardDTO);
	}

	@Override
	public List<ImageboardDTO> getImageboardList(Map<String, Integer> map) {
		return sqlSession.selectList("imageboardSQL.getImageboardList", map);
	}

	@Override
	public void imageboardDelete(Map<String, String[]> map) {
		sqlSession.delete("imageboardSQL.imageboardDelete", map);
	}

	@Override
	public int getImageboardTotalA() {
		return sqlSession.selectOne("imageboardSQL.getImageboardTotalA");
	}

	@Override
	public ImageboardDTO getImageboardView(String seq) {
		return sqlSession.selectOne("imageboardSQL.getImageboardView",Integer.parseInt(seq));
	}
	
	
}
