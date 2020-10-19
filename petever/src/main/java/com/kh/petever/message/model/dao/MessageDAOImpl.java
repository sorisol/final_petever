package com.kh.petever.message.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.petever.message.model.vo.Message;

@Repository
public class MessageDAOImpl implements MessageDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<Message> selectMessageList(int limit, int offset) {
		RowBounds rowBounds = new RowBounds(offset, limit);
		return sqlSession.selectList("message.selectMessageList",null,rowBounds);
	}

	@Override
	public int selectMessageTotalContents() {
		return sqlSession.selectOne("message.selectMessageTotalContents");
	}

	@Override
	public int insertMessage(Message message) {
		return sqlSession.insert("message.insertMessage", message);
	}

	@Override
	public int deleteMessage(Map<String, String> param) {
		return sqlSession.delete("message.deleteMessage", param);
	}


	@Override
	public List<Message> selectOneUser(Message msg) {
		return sqlSession.selectList("message.selectOneUser", msg);
	}

	@Override
	public List<Message> selectGetDate(Message msg) {
		return sqlSession.selectList("message.selectGetDate", msg);
	}

	
	

}
