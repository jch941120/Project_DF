package org.sweeter.application.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.sweeter.application.model.dto.Post;
import org.sweeter.application.model.service.PostService;

@Controller
public class PostController {
	@Autowired
	PostService postService;
	
	
	@RequestMapping("/posts/{category}/{page}/{count}")
	@ResponseBody
	public List<Post> post(@PathVariable int category, @PathVariable int page,@PathVariable int count){
		return postService.getPostList(category, page, count);
	}
	
	@PostMapping("/post/create")
	public String create(Post post) {
		postService.create(post);
		
		int category = post.getCategory();
		return "/posts/"+category+"/1/10";

	}
	//게시물 수정
	@PostMapping("/post/modify")
	public String modify(Post post) {
		postService.modify(post);
		
		return "/post/list";
		
	}
	//게시물 삭제
	@PostMapping("/post/delete")
	public String delete(String id) {
		
		//DB에 게시물 정보 삭제
		postService.delete(id);
		//게시물목록 이동
		return "/post/list";
		
	}
}
