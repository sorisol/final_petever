package com.kh.petever.animalTag.model.service;

import java.util.List;

import com.kh.petever.animalTag.model.vo.AnimalTag;

public interface AnimalTagService {

	int insertAniTag(AnimalTag aniTag);

	List<AnimalTag> selectList(String userId);

}
