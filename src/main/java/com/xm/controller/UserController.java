package com.xm.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageInfo;
import com.xm.pojo.Permission;
import com.xm.pojo.Role;
import com.xm.pojo.Users;
import com.xm.service.IPermissionService;
import com.xm.service.IRoleService;
import com.xm.service.IUsersRoleKeyService;
import com.xm.service.IUsersService;

@Controller
@RequestMapping("/users")
public class UserController {

	@Autowired
	IUsersService usersService;
	
	@Autowired
	IRoleService roleService;
	
	@Autowired
	IUsersRoleKeyService usersRoleKeyService;
	
	@Autowired
	IPermissionService permissionService;
	
	@Autowired
	PasswordEncoder passwordEncoder;
	
	/**查询所有用户并分页显示
	 * @param model
	 * @param pageNum
	 * @param pageSize
	 * @return admin/users-list
	 */
	@RequestMapping("/usersList")
	public String usersList(Model model,@RequestParam(name = "pageNum",required = true,defaultValue = "1") Integer pageNum,
			@RequestParam(name = "pageSize",required = true,defaultValue = "5") Integer pageSize) {
		List<Users> allUsersList = usersService.queryAllUsers(pageNum,pageSize);
		PageInfo<Users> pageInfo = new PageInfo<Users>(allUsersList);
		model.addAttribute("pageInfo", pageInfo);
		
		return "admin/users-list";
	}
	
	/**用户详情
	 * 	用户与角色是多对多关系
	 * 	角色与资源权限是多对多关系
	 *	将要显示的信息查询出来，并Users对象setRoles 和 Role对象setPermissions
	 * @param id
	 * @return
	 */
	@RequestMapping("/usersInfo")
	public String usersInfo(Model model,Integer id) {
		//获取users对象，方法里已封装了roles
		Users users = usersService.selectById(id);
		//获取users.getRoles()遍历，通过每个role，查询对应的permission，setPermissions属性
		if(null != users.getRoles()) {
			for(Role role : users.getRoles()) {
				List<Permission> permissions = permissionService.queryByRoleId(role.getId());
				//此角色没有权限资源，则跳出此次循环
				if(null == permissions) {
					continue;
				}
				role.setPermissions(permissions);
			}
		}
		model.addAttribute("users", users);
		
		return "admin/users-info";
	}
	
	/**添加用户
	 * @param users
	 * @return
	 */
	@RequestMapping("/usersAdd")
	public String usersAdd(Users users) {
		users.setPassword(passwordEncoder.encode(users.getPassword()));
		usersService.addUsers(users);
		
		return "redirect:usersList.action";
	}
	
	/**点击角色关联，需要渲染界面的数据
	 * @param model
	 * @param usersId
	 * @return
	 */
	@RequestMapping("/usersRoleAddPage")
	public String usersRoleAddPage(Model model,Integer usersId) {
		List<Integer> roleIds = roleService.queryRoleIdByUsersId(usersId);
		//roleIds为null，证明此用户没有其他角色，添加一个id为0的元素；以id为0除外的角色都会被查询出来
		if(null == roleIds) {
			roleIds = new ArrayList<Integer>();
			roleIds.add(0);
		}
		
		List<Role> roles = roleService.queryRoleByNotRoleIds(roleIds);
		
		model.addAttribute("usersId", usersId);
		model.addAttribute("roles", roles);
		
		return "admin/users-role-add";
	}
	
	/**角色关联，将usersId和roleId添加到中间表实现关联功能
	 * @param usersId
	 * @param roleId
	 * @return
	 */
	@RequestMapping("/usersRoleAdd")
	public String usersRoleAdd(Integer usersId,Integer roleId[]) {
		usersRoleKeyService.addUsersAssociationRole(usersId,roleId);
		
		return "redirect:usersList.action";
	}
	
}
