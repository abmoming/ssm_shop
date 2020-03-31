package com.xm.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.xm.mapper.RoleMapper;
import com.xm.pojo.Permission;
import com.xm.pojo.Role;
import com.xm.pojo.RoleExample;
import com.xm.pojo.RolePermissionKey;
import com.xm.pojo.Users;
import com.xm.pojo.UsersRoleKey;

@Service
public class RoleServiceImpl implements IRoleService {
	
	@Autowired
	RoleMapper roleMapper;
	
	@Autowired
	IUsersRoleKeyService usersRoleKeyService;
	
	@Autowired
	IRolePermissionKeyService rolePermissionKeyService;
	
	@Autowired
	IPermissionService permissionService;
	
	@Override
	public List<Role> queryRoleByUsersId(Integer usersId) {
		List<UsersRoleKey> usersRoleKeyList = usersRoleKeyService.queryByUsersId(usersId);
		if(null == usersRoleKeyList) {
			return null;
		}
		
		List<Integer> roleIdList = new ArrayList<Integer>();
		for(UsersRoleKey usersRoleKey : usersRoleKeyList) {
			roleIdList.add(usersRoleKey.getRoleid());
		}
		
		RoleExample example = new RoleExample();
		example.or().andIdIn(roleIdList);
		List<Role> roleList = roleMapper.selectByExample(example);
		
		return roleList;
	}
	
	private void setPermissions(List<Role> roles) {
		for(Role role : roles) {
			setPermissions(role);
		}
	}

	private void setPermissions(Role role) {
		List<Permission> permissionList = permissionService.queryByRoleId(role.getId());
		
		role.setPermissions(permissionList);
	}

	@Override
	public List<Role> queryRoles(Integer pageNum,Integer pageSize) {
		PageHelper.startPage(pageNum, pageSize);
		List<Role> roles = roleMapper.selectByExample(null);
		
		return roles;
	}

	@Override
	public void addRole(Role role) {
		roleMapper.insert(role);
	}

	@Override
	public List<Integer> queryRoleIdByUsersId(Integer usersId) {
		List<UsersRoleKey> usersRoleKeyList = usersRoleKeyService.queryByUsersId(usersId);
		//如果此用户没有权限，则返回null
		if(null == usersRoleKeyList) {
			return null;
		}
		
		List<Integer> roleIds = new ArrayList<Integer>();
		for(UsersRoleKey usersRoleKey : usersRoleKeyList) {
			roleIds.add(usersRoleKey.getRoleid());
		}
		
		return roleIds;
	}

	@Override
	public List<Role> queryRoleByNotRoleIds(List<Integer> roleIds) {
		RoleExample example = new RoleExample();
		example.or().andIdNotIn(roleIds);
		
		List<Role> roles = roleMapper.selectByExample(example);
		
		return roles;
		
	}

	@Override
	public Role selectRoleById(Integer roleId) {
		Role role = roleMapper.selectByPrimaryKey(roleId);
		
		return role;
	}
	

}
