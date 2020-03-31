package com.xm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xm.mapper.ReviewMapper;
import com.xm.pojo.Review;
import com.xm.pojo.ReviewExample;
import com.xm.pojo.Users;

@Service
public class ReviewServiceimpl implements IReviewService {
	
	@Autowired
	ReviewMapper reviewMapper;
	
	@Autowired
	IUsersService usersService;
	
	
	@Override
	public List<Review> querytReviewById(Integer product_id) {
		ReviewExample example = new ReviewExample();
		example.or().andProductIdEqualTo(product_id);
		example.setOrderByClause("id desc");
		List<Review> reviewList = reviewMapper.selectByExample(example);
		setUsers(reviewList);
		
		return reviewList;
	}
	public void setUsers(List<Review> reviewList) {
		for(Review review : reviewList) {
			setUsers(review);
		}
	}
	public void setUsers(Review review) {
		Users user = usersService.selectById(review.getUsersId());
		review.setUser(user);
	}
	
	@Override
	public Integer queryReviewCount(Integer product_id) {
		ReviewExample example = new ReviewExample();
		example.or().andProductIdEqualTo(product_id);
		List<Review> reviewList = reviewMapper.selectByExample(example);
		return reviewList.size();
	}

}
