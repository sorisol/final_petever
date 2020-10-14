package com.kh.petever.message.model.dao;

import java.util.List;

import com.kh.petever.message.model.vo.Message;

public interface MessageDAO {

	List<Message> selectMessageList(int limit, int offset);

	int selectMessageTotalContents();

}
