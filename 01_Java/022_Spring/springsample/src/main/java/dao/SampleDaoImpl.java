package dao;

import org.springframework.stereotype.Component;

@Component
public class SampleDaoImpl implements SampleDao {
	public String sayHello() {
		return "Hello!";
	}
}