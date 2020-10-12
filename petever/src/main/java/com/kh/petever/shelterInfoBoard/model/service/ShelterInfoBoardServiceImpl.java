package com.kh.petever.shelterInfoBoard.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.petever.shelterInfoBoard.model.dao.ShelterInfoBoardDAO;
import com.kh.petever.shelterInfoBoard.model.vo.ShelterInfoBoard;

@Service
public class ShelterInfoBoardServiceImpl implements ShelterInfoBoardService {

	@Autowired
	private ShelterInfoBoardDAO shelterInfoBoardDAO;

	@Override
	public List<ShelterInfoBoard> selectBoardList(int limit, int offset) {
		return shelterInfoBoardDAO.selectBoardList(limit, offset);
	}

	@Override
	public int selectBoardTotalContents() {
		return shelterInfoBoardDAO.selectBoardTotalContents();
	}
	
}
