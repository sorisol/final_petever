package com.kh.petever.message.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import com.kh.petever.message.model.vo.Message;
import com.kh.petever.user.model.vo.User;


public interface MessageService {


	int selectMessageTotalContents();

	List<Message> selectMessageList(User user, RowBounds rowBound);


	int insertMessage(Message message);

	int deleteMessage(Map<String, String> param);


	List<Message> selectOneUser(Message msg);

	List<Message> selectGetDate(Message msg);


}
