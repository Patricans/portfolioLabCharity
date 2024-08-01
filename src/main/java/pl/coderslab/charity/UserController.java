package pl.coderslab.charity;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import pl.coderslab.charity.models.User;
import pl.coderslab.charity.repositories.UsersRepository;
import pl.coderslab.charity.validators.UserValidator;

@Controller
public class UserController {
    @Autowired
    private UserValidator userValidator;
    @Autowired
    private UsersRepository usersRepository;

    @GetMapping(value = "/rejestracja")
    public String registerForm(Model model) {
        model.addAttribute("userForm", new User());
        return "register";
    }
    @PostMapping(value ="/rejestracja")
    public String postRegisterForm(@ModelAttribute("userForm")
                                   User userForm, BindingResult bindingResult, Model model, RedirectAttributes redirectAttributes) {

        userValidator.validate(userForm, bindingResult);
        if (bindingResult.hasErrors()) {
            model.addAttribute("isFormResend", true);
            model.addAttribute("title", "Rejestracja");
            return "register";

        }
        usersRepository.save(userForm);

        redirectAttributes.addFlashAttribute("flashMessage", "Konto zostało zarejestrowane");
        redirectAttributes.addFlashAttribute("flashClass", "alert-success");
        return "redirect:/";
    }
}

