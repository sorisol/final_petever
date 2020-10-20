package com.kh.petever.message.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import com.kh.petever.message.model.vo.Message;
import com.kh.petever.user.model.vo.User;

public interface MessageDAO {

	List<Message> selectMessageList(User user, RowBounds rowBound);

	int selectMessageTotalContents();

	int insertMessage(Message message);

	int deleteMessage(Map<String, String> param);


	List<Message> selectOneUser(Message msg);

	List<Message> selectGetDate(Message msg);


}
