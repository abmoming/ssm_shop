package com.xm.service;

import java.util.List;

import com.xm.pojo.Permission;
import com.xm.pojo.Role;

public interface IPermissionService {

	/**从中间表rolePermissionKey中，通过roleIds查询对应的permissionId
	 * 再通过permissionId查询对应的permission
	 * @param roleId
	 * @return List<Permission>
	 */
	List<Permission> queryByRoleId(Integer roleId);

	/**分页查询所有资源权限
	 * @param pageNum
	 * @param pageSize
	 * @return
	 */
	List<Permission> queryAllPermission(Integer pageNum,Integer pageSize);

	/**添加资源权限
	 * @param permission
	 */
	void addPermission(Permission permission);

	/**通过RoleId从中间表查询对应的PermissionId
	 * 若查不到，则return null
	 * @param roleId
	 * @return List<Integer>
	 */
	List<Integer> queryPermissionIdByRoleId(Integer roleId);

	/**查询Permission，条件：不为集合中的Id
	 * @param permissionIds
	 * @return List<Permission>
	 */
	List<Permission> queryPermissionByNotPermissionIds(List<Integer> permissionIds);

}
