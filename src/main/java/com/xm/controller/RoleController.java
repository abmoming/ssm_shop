package com.xm.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageInfo;
import com.xm.pojo.Permission;
import com.xm.pojo.Role;
import com.xm.service.IPermissionService;
import com.xm.service.IRolePermissionKeyService;
import com.xm.service.IRoleService;

@Controller
@RequestMapping("/role")
public class RoleController {
	
	@Autowired
	IRoleService roleService; 
	
	@Autowired
	IPermissionService permissionService;
	
	@Autowired
	IRolePermissionKeyService rolePermissionKeyService;
	
	/**分页查询roles
	 * @param model
	 * @param pageNum
	 * @param pageSize
	 * @return
	 */
	@RequestMapping("/roleList")
	public String roleList(Model model,@RequestParam(value = "pageNum",required = true,defaultValue = "1") Integer pageNum,
			@RequestParam(value = "pageSize",required = true,defaultValue = "5") Integer pageSize) {
		List<Role> roles = roleService.queryRoles(pageNum,pageSize);
		PageInfo pageInfo = new PageInfo(roles);
		
		model.addAttribute("pageInfo", pageInfo);
		
		return "admin/role-list";
	}
	
	/**角色添加
	 * @param role
	 * @return
	 */
	@RequestMapping("/roleAdd")
	public String roleAdd(Role role) {
		roleService.addRole(role);
		
		return "redirect:roleList.action";
	}
	
	/**跳转role-permission-add.jsp界面，需要查询的数据（查询该角色下的资源权限）
	 * @param model
	 * @param roleId
	 * @return
	 */
	@RequestMapping("/rolePermissionAddPage")
	public String rolePermissionAddPage(Model model,Integer roleId) {
		Role role = roleService.selectRoleById(roleId);
		List<Integer> permissionIds = permissionService.queryPermissionIdByRoleId(role.getId());
		if(null == permissionIds) {
			//假设此角色没有资源权限，就实例化并添加一个id为0的role存进集合中，当查询该角色没有添加的资源时，就可全部查询出来
			permissionIds = new ArrayList<Integer>();
			permissionIds.add(0);
		}
		List<Permission> permissions = permissionService.queryPermissionByNotPermissionIds(permissionIds);
		
		model.addAttribute("role", role);
		model.addAttribute("permissions", permissions);
		
		return "admin/role-permission-add";
	}
	
	@RequestMapping("/rolePermissionAdd")
	public String rolePermissionAdd(Integer roleId,Integer permissionId[]) {
		rolePermissionKeyService.addRoleIdAndPermissionId(roleId,permissionId);
		
		return "redirect:roleList.action";
	}
	
	@RequestMapping("/roleInfo")
	public String roleInfo(Model model,Integer roleId) {
		Role role = roleService.selectRoleById(roleId);
		List<Permission> permissions = permissionService.queryByRoleId(role.getId());
		//该角色有资源权限就set进去role对象的permissions集合中
		if(null != permissions) {
			role.setPermissions(permissions);
		}
		
		model.addAttribute("role", role);
		
		
		return "admin/role-info";
	}
	
	

}
