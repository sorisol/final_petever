package com.kh.petever.message.model.service;

import java.util.List;
import java.util.Map;

import com.kh.petever.message.model.vo.Message;


public interface MessageService {


	int selectMessageTotalContents();

	List<Message> selectMessageList(int limit, int offset);


	int insertMessage(Message message);

	int deleteMessage(Map<String, String> param);


	List<Message> selectOneUser(Message msg);

	List<Message> selectGetDate(Message msg);


}
