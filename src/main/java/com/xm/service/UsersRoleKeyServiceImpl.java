package com.xm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xm.mapper.UsersRoleMapper;
import com.xm.pojo.UsersRoleExample;
import com.xm.pojo.UsersRoleKey;

@Service
public class UsersRoleKeyServiceImpl implements IUsersRoleKeyService {
	
	@Autowired
	UsersRoleMapper usersRoleMapper;
	
	@Override
	public List<UsersRoleKey> queryByUsersId(Integer usersId) {
		UsersRoleExample example = new UsersRoleExample();
		example.or().andUseridEqualTo(usersId);
		List<UsersRoleKey> usersRoleKeyList = usersRoleMapper.selectByExample(example);
		
		if(usersRoleKeyList.isEmpty()) {
			return null;
		}
		
		return usersRoleKeyList;
	}

	@Override
	public void addUsersAssociationRole(Integer usersId, Integer[] roleId) {
		for(Integer id : roleId) {
			UsersRoleKey usersRole = new UsersRoleKey();
			usersRole.setUserid(usersId);
			usersRole.setRoleid(id);
			usersRoleMapper.insert(usersRole);
		}
	}

}
