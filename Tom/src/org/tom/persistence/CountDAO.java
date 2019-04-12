package org.tom.persistence;

import java.util.ArrayList;

import org.tom.domain.CountVO;

public interface CountDAO {
	public ArrayList<CountVO> countListRead (int point_index);
	public CountVO countRead(int point_index);
	public int addCount(CountVO vo);
	public int deleteCount(CountVO vo);
	
}
