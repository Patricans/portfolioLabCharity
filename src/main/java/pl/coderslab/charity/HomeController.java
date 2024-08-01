package pl.coderslab.charity;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import pl.coderslab.charity.models.Donation;
import pl.coderslab.charity.models.Institution;
import pl.coderslab.charity.models.UserMessage;
import pl.coderslab.charity.repositories.DonationRepository;
import pl.coderslab.charity.repositories.InstitutionRepository;
import pl.coderslab.charity.repositories.UserMessagesRepository;


@Controller
public class HomeController {
    @Autowired
    private InstitutionRepository institutionRepository;
    @Autowired
    private DonationRepository donationRepository;
    @Autowired
    private UserMessagesRepository userMessagesRepository;

    @RequestMapping("/")
    public String homeAction(Model model) {
        model.addAttribute("institutions", institutionRepository.findAll());
        model.addAttribute("donationsSum", donationRepository.findDonationSum());
        model.addAttribute("donationsCount", donationRepository.count());
        model.addAttribute("donation", new Donation());
        model.addAttribute("contactForm", new UserMessage());
        return "index";
    }
    @PostMapping("/kontakt")
    public String postContact(Model model, UserMessage userMessage, RedirectAttributes redirectAttributes) {
        userMessagesRepository.save(userMessage);
        redirectAttributes.addFlashAttribute("flashMessage", "Wiadomość została wysłana");
        redirectAttributes.addFlashAttribute("flashClass", "alert-success");
        return "redirect:/";
    }
}
