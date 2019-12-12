package org.sweeter.application.model.mapper;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.sweeter.application.model.dto.Post;

import lombok.extern.log4j.Log4j2;

@SpringBootTest
@Log4j2
public class PostMapperTest {
	@Autowired
	PostMapper mapper;
	
	@Test
	public void getPostListTest() {
		List<Post> ls = mapper.getPostList(1, 1, 10);
		
		log.info(ls);
	}
	
	@Test
	public void getAllPostTest() {
		List<Post> ls = mapper.getAllPost();
		log.info(ls);
	}
}
