package controller;

import java.util.Locale;

import service.IndexService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import form.InputForm;

@Controller
public class IndexController {
	@Autowired
	IndexService indexService;

	@ModelAttribute
	public InputForm setUpInputForm() {
		InputForm form = new InputForm();
		return form;
	}

	@RequestMapping(value = "/", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public String index(Locale locale, Model model) {
		model.addAttribute("msg", indexService.selectMsg());
		return "index";
	}

	@RequestMapping(value = "showName", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String showName(InputForm form, Model model) {
		model.addAttribute("msg", indexService.selectMsg());
		model.addAttribute("name", form.getName());
		return "index";
	}
}