package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dao.SampleDao;

@Component
public class SampleServiceImpl implements SampleService {
	@Autowired
	SampleDao sampleDao;

	public String sayHello() {
		return sampleDao.sayHello();
	}
}