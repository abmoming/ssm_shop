package com.xm.service;

import java.util.List;

import com.xm.pojo.Review;

public interface IReviewService {

	/**ͨ通过商品id查询相关的用户对此商品的评论
	 * @param id
	 * @return
	 */
	List<Review> querytReviewById(Integer product_id);
	
	/**ͨ通过商品id查询此商品被评论的总条数
	 * @param product_id
	 * @return
	 */
	Integer queryReviewCount(Integer product_id);
	
}
