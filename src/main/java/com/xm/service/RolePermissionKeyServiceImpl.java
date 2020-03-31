package com.xm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xm.mapper.RolePermissionMapper;
import com.xm.pojo.RolePermissionExample;
import com.xm.pojo.RolePermissionKey;

@Service
public class RolePermissionKeyServiceImpl implements IRolePermissionKeyService {
	
	@Autowired
	RolePermissionMapper rolePermissionMapper;
	
	
	@Override
	public List<RolePermissionKey> queryPermissionIdByRoleId(Integer id) {
		RolePermissionExample example = new RolePermissionExample();
		example.or().andRoleidEqualTo(id);
		List<RolePermissionKey> rolePermissionKeyList = rolePermissionMapper.selectByExample(example);
		//此角色没有资源权限，就return null
		if(rolePermissionKeyList.isEmpty()) {
			return null;
		}
		
		return rolePermissionKeyList;
	}


	@Override
	public void addRoleIdAndPermissionId(Integer roleId, Integer[] permissionIds) {
		RolePermissionKey rolePermissionKey = new RolePermissionKey();
		for(Integer permissionId : permissionIds) {
			rolePermissionKey.setRoleid(roleId);
			rolePermissionKey.setPermissionid(permissionId);
			rolePermissionMapper.insert(rolePermissionKey);
		}
	}

}
