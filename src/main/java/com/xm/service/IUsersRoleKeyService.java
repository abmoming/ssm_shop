package com.xm.service;

import java.util.List;

import com.xm.pojo.UsersRoleKey;

public interface IUsersRoleKeyService {

	/**通过UsersId从中间表UsersRole查询
	 * @param usersId
	 * @return List<UsersRoleKey>
	 */
	public List<UsersRoleKey> queryByUsersId(Integer usersId);

	/**通过UsersId和RoleId在中间表关联
	 * @param usersId
	 * @param roleId
	 */
	public void addUsersAssociationRole(Integer usersId, Integer[] roleId);
	
}
