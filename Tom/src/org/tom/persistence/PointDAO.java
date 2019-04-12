/*
 * 		  	FILE : PointDAO.java
 * 		  AUTHOR : Yeh Seob Lee
 * LAST MODIFIED : 2019 - 03- 27
 * 		 COMMENT : 
 */

package org.tom.persistence;

import java.util.ArrayList;

import org.tom.domain.PointVO;

public interface PointDAO {
	public ArrayList<PointVO> getPointList(int user_index);
	public boolean addPoint(PointVO vo) ;
	public boolean modifyPoint(PointVO vo);
	public boolean deletePoint(PointVO vo);
}
