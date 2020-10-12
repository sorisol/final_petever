package com.kh.petever.shelterInfoBoard.model.dao;

import java.util.List;

import com.kh.petever.shelterInfoBoard.model.vo.ShelterInfoBoard;

public interface ShelterInfoBoardDAO {

	List<ShelterInfoBoard> selectBoardList(int limit, int offset);

	int selectBoardTotalContents();

}
