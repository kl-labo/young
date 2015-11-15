package dao;

import org.springframework.stereotype.Component;

@Component
public class IndexDaoImpl implements IndexDao {
	public String selectMsg() {
		return "Hello";
	}
}
