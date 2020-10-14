package com.kh.petever.message.model.dao;

import java.util.List;	

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
	
	

}
