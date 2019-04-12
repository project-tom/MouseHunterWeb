/*
 * 		  	FILE : UserDAO.java
 * 		  AUTHOR : Yeh Seob Lee
 * LAST MODIFIED : 2019 - 03- 27
 * 		 COMMENT : 
 */

package org.tom.persistence;

import java.util.ArrayList;

import org.tom.domain.UserVO;

public interface UserDAO {
	public boolean userAdd(UserVO vo);
	public boolean userSignIn(UserVO vo);
	public boolean userCheckID(UserVO vo);
	public int userInfoModify(UserVO vo);
	public ArrayList<UserVO> userInfoList();
	public UserVO userInfo(UserVO vo);
	public int userDelete(UserVO vo);
	public int userIndexReturn(UserVO vo);
}
