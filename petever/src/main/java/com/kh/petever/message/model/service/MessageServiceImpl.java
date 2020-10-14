package com.kh.petever.message.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.petever.message.model.dao.MessageDAO;
import com.kh.petever.message.model.vo.Message;

@Service
public class MessageServiceImpl  implements MessageService{
	
	@Autowired
	private MessageDAO messageDAO;

	@Override
	public int selectMessageTotalContents() {
		return messageDAO.selectMessageTotalContents();
	}

	@Override
	public List<Message> selectMessageList(int limit, int offset) {
		return messageDAO.selectMessageList(limit,offset);
	}
	
	
	
	

}
