package com.kh.petever.message.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.petever.message.model.vo.Message;
import com.kh.petever.user.model.vo.User;

@Repository
public class MessageDAOImpl implements MessageDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<Message> selectMessageList(User user, RowBounds rowBounds) {
		return sqlSession.selectList("message.selectMessageList", user, rowBounds);
	}

	@Override
	public int selectMessageTotalContents(User user) {
		return sqlSession.selectOne("message.selectMessageTotalContents", user);
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
