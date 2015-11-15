package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dao.IndexDao;

@Component
public class IndexServiceImpl implements IndexService {
	@Autowired
	IndexDao indexDao;

	public String selectMsg() {
		return indexDao.selectMsg();
	}
}