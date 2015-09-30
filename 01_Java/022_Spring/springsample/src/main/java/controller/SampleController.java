package controller;

import java.util.Locale;

import service.SampleService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SampleController {
	@Autowired
	private SampleService sampleService;

	@RequestMapping(value = "/sample.html", method = RequestMethod.GET)
	public String get(Locale locale, Model model) {
		model.addAttribute("hello", sampleService.sayHello());
		return "sample";
	}
}