package com.xm.service;

import java.util.List;

import com.xm.pojo.RolePermissionKey;

public interface IRolePermissionKeyService {

	/**通过roleId查询对应的RolePermissionKey
	 * 若此角色没有资源权限，则return null
	 * @param id
	 * @return List<RolePermissionKey>
	 */
	List<RolePermissionKey> queryPermissionIdByRoleId(Integer id);

	/**角色关联资源权限，从中间表添加roleId和permissionid
	 * @param roleId
	 * @param permissionIds
	 */
	void addRoleIdAndPermissionId(Integer roleId, Integer[] permissionIds);

}
