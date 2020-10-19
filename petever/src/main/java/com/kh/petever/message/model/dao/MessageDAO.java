package com.kh.petever.message.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.petever.message.model.vo.Message;

public interface MessageDAO {

	List<Message> selectMessageList(int limit, int offset);

	int selectMessageTotalContents();

	int insertMessage(Message message);

	int deleteMessage(Map<String, String> param);


	List<Message> selectOneUser(Message msg);


}
