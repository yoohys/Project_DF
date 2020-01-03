package org.sweeter.application.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.sweeter.application.model.dto.Jobs;
import org.sweeter.application.model.mapper.JobMapper;

@Service
public class JobServiceImple implements JobService {
	@Autowired
	JobMapper jobmapper;

	@Override
	public void write(Jobs jobs) {
		jobmapper.writeJob(jobs);

	}

	@Override
	public void modify(Jobs jobs) {
		jobmapper.updateJob(jobs);

	}

	@Override
	public void delete(int id) {
		jobmapper.deleteJob(id);

	}

	@Override
	public Jobs getJobs(int id) {
		return jobmapper.getJobById(id);
	}

	@Override
	public List<Jobs> getAllJobs() {
		return jobmapper.getAllJob();
	}

	@Override
	public List<Jobs> getJobsList(int page, int count) {
		return jobmapper.getJobList(page, count);
	}

}
