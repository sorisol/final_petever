package com.kh.petever.message.model.vo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Message implements Serializable{

	private int msgNo;
	private String userId;
	private String receiveId;
	private String msgContent;
	private String msgTime;
	private String sub;
	
}
