package com.kh.petever.message.model.service;

import java.util.List;

import com.kh.petever.message.model.vo.Message;


public interface MessageService {


	int selectMessageTotalContents();

	List<Message> selectMessageList(int limit, int offset);


	int insertMessage(Message message);

}
