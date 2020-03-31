package com.xm.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.xm.mapper.PermissionMapper;
import com.xm.pojo.Permission;
import com.xm.pojo.PermissionExample;
import com.xm.pojo.RolePermissionKey;

@Service
public class PermissionServiceImpl implements IPermissionService {
	
	@Autowired
	PermissionMapper permissionMapper;
	
	@Autowired
	IRolePermissionKeyService rolePermissionKeyService;
	
	@Override
	public List<Permission> queryByRoleId(Integer roleId) {
		List<Integer> permissionIds = queryPermissionIdByRoleId(roleId);
		if(null == permissionIds) {
			return null;
		}
		
		PermissionExample example = new PermissionExample();
		example.or().andIdIn(permissionIds);
		List<Permission> permissions = permissionMapper.selectByExample(example);
		
		return permissions;
	}

	@Override
	public List<Permission> queryAllPermission(Integer pageNum, Integer pageSize) {
		PageHelper.startPage(pageNum, pageSize);
		List<Permission> permissions = permissionMapper.selectByExample(null);
		
		return permissions;
	}

	@Override
	public void addPermission(Permission permission) {
		permissionMapper.insert(permission);
	}

	@Override
	public List<Integer> queryPermissionIdByRoleId(Integer roleId) {
		List<RolePermissionKey> rolePermissionKeyList = rolePermissionKeyService.queryPermissionIdByRoleId(roleId);
		if(null == rolePermissionKeyList) {
			return null;
		}
		List<Integer> permissionIds = new ArrayList<Integer>();
		for(RolePermissionKey rolePermissionKey : rolePermissionKeyList) {
			permissionIds.add(rolePermissionKey.getPermissionid());
		}
		
		return permissionIds;
	}

	@Override
	public List<Permission> queryPermissionByNotPermissionIds(List<Integer> permissionIds) {
		PermissionExample example = new PermissionExample();
		example.or().andIdNotIn(permissionIds);
		
		List<Permission> permissions = permissionMapper.selectByExample(example);
		if(permissions.isEmpty()) {
			return null;
		}
		
		return permissions;
	}

}
