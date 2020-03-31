package com.xm.service;

import java.util.List;

import com.xm.pojo.Role;

public interface IRoleService {
	
	/**通过usersId查询role
	 * 1. 先从中间表usersRole中通过usersId查询对应的usersRoleKey，返回List<UsersRoleKey>
	 * 2.创建一个List，通过循环遍历将RoleId存进该集合中List<Integer>
	 * 3.再从role表中通过List<Integer>查询对应的role
	 * @param usersId
	 * @return List<Role>
	 */
	public List<Role> queryRoleByUsersId(Integer usersId);

	/**分页查询所有Role
	 * @param pageNum
	 * @param pageSize
	 * @return
	 */
	public List<Role> queryRoles(Integer pageNum,Integer pageSize);

	/**添加role
	 * @param role
	 */
	public void addRole(Role role);

	/**通过usersId从中间表查询对应roleIds
	 * @param usersId
	 * @return List<Integer>
	 */
	public List<Integer> queryRoleIdByUsersId(Integer usersId);

	/**查询Role，条件：id不为集合中的id
	 * @param roleIds
	 * @return List<Role>
	 */
	public List<Role> queryRoleByNotRoleIds(List<Integer> roleIds);

	/**通过Id查询对应的Role
	 * @param roleId
	 * @return Role
	 */
	public Role selectRoleById(Integer roleId);

}
