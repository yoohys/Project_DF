package org.sweeter.application.model.mapper;

import java.util.List;

import org.sweeter.application.model.dto.Jobs;

public interface JobMapper {
	
	//Question 부분
	public void writeJob(Jobs jobs);
	public void updateJob(Jobs jobs);
	public void deleteJob(int id);
	public List<Jobs> getJobList(int page, int count);
	public List<Jobs> getAllJob();
	public Jobs getJobById(int id);
	


}
