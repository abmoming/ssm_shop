package com.xm.service;

import java.util.List;

import org.springframework.security.core.userdetails.UserDetailsService;

import com.xm.pojo.Users;

public interface IUsersService extends UserDetailsService {
	/**检查用户是否存在
	 * @param username
	 * @param password
	 */
	Users checkUserExists(String username, String password);
	
	/**ͨ通过主键查询对应的用户
	 * @param id
	 * @return Users
	 */
	Users selectById(Integer id);

	/**查询所有用户
	 * @return List<Users>
	 */
	List<Users> queryAllUsers(Integer pageNum,Integer pageSize);

	/**添加用户
	 * @param users
	 */
	void addUsers(Users users);
}
