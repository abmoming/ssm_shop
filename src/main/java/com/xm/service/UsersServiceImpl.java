package com.xm.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.xm.mapper.UsersMapper;
import com.xm.pojo.Role;
import com.xm.pojo.Users;
import com.xm.pojo.UsersExample;

@Service
public class UsersServiceImpl implements IUsersService {

	@Autowired
	UsersMapper usersMapper;
	
	@Autowired
	IRoleService roleService;
	
	@Override
	public Users checkUserExists(String username, String password) {
		UsersExample example = new UsersExample();
		example.or().andUsernameEqualTo(username).andPasswordEqualTo(password);
		
		List<Users> usersList = usersMapper.selectByExample(example);
		if(usersList.isEmpty()) {
			return null;
		}
		return usersList.get(0);
	}

	@Override
	public Users selectById(Integer id) {
		Users users = usersMapper.selectByPrimaryKey(id);
		if(null != users) {
			setRoles(users);
		}
		return users;
	}

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		UsersExample example = new UsersExample();
		example.or().andUsernameEqualTo(username);
		List<Users> usersList = usersMapper.selectByExample(example);
		if(usersList.isEmpty()) {
			return null;
		}
		//要在前端设定用户名不能重复
		Users users = usersList.get(0);
		//通过中间表usersRoleKey查询roleIds，再通过roleIds查询List<Role>
		List<Role> roleList = roleService.queryRoleByUsersId(users.getId());
		
		User user = new User(users.getUsername(),users.getPassword(),users.getStatus()==1?true:false,true,true,true, getAuthority(roleList));
		
		
		return user;
	}
	
	public List<SimpleGrantedAuthority> getAuthority(List<Role> roleList) {
		List<SimpleGrantedAuthority> authorityList = new ArrayList<SimpleGrantedAuthority>();
		for(Role role : roleList) {
			authorityList.add(new SimpleGrantedAuthority("ROLE_" + role.getRolename()));
		}
		
		return authorityList;
	}

	@Override
	public List<Users> queryAllUsers(Integer pageNum,Integer pageSize) {
		PageHelper.startPage(pageNum, pageSize);
		List<Users> allUsersList = usersMapper.selectByExample(null);
		
		return allUsersList;
	}
	
	private void setRoles(List<Users> usersList) {
		for(Users users : usersList) {
			setRoles(users);
		}
	}

	private void setRoles(Users users) {
		List<Role> roles = roleService.queryRoleByUsersId(users.getId());
		if(null != roles) {
			users.setRoles(roles);
		}
	}

	@Override
	public void addUsers(Users users) {
		usersMapper.insert(users);
	}
	

}
