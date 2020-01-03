package org.sweeter.application.model.service;

import java.util.List;

import org.sweeter.application.model.dto.Jobs;

public interface JobService {

	void write(Jobs job);

	void modify(Jobs job);

	void delete(int id);

	Jobs getJobs(int id);

	List<Jobs> getAllJobs();

	List<Jobs> getJobsList(int page, int count);
}
