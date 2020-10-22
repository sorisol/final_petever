package com.kh.petever.message.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.petever.message.model.dao.MessageDAO;
import com.kh.petever.message.model.vo.Message;
import com.kh.petever.user.model.vo.User;

@Service
public class MessageServiceImpl  implements MessageService{
	
	@Autowired
	private MessageDAO messageDAO;

	@Override
	public int selectMessageTotalContents(User user) {
		return messageDAO.selectMessageTotalContents(user);
	}

	@Override
	public List<Message> selectMessageList(User user, RowBounds rowBound) {
		return messageDAO.selectMessageList(user, rowBound);
	}

	@Transactional(rollbackFor = {Exception.class})
	@Override
	public int insertMessage(Message message) {
		int result = 0;
		
		//1. Message 테이블에 insert
		result = messageDAO.insertMessage(message);
		
		return result;
	}

	@Override
	public int deleteMessage(Map<String, String> param) {
		// TODO Auto-generated method stub
		return messageDAO.deleteMessage(param);
	}

	@Override
	public List<Message> selectOneUser(Message msg) {
		return messageDAO.selectOneUser(msg);
	}

	@Override
	public List<Message> selectGetDate(Message msg) {
		return messageDAO.selectGetDate(msg);
	}
	
	
	
	

}
