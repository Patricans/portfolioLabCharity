package pl.coderslab.charity;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.charity.models.Donation;
import pl.coderslab.charity.repositories.CategoryRepository;
import pl.coderslab.charity.repositories.DonationRepository;
import pl.coderslab.charity.repositories.InstitutionRepository;

@Controller
public class DonationController {

    @Autowired
    private DonationRepository donationRepository;
    @Autowired
    private CategoryRepository categoryRepository;
    @Autowired
    private InstitutionRepository institutionRepository;

    @RequestMapping("/oddaj")
    public String giveAction(Model model) {
        model.addAttribute("categories", categoryRepository.findAll());
        model.addAttribute("institutions", institutionRepository.findAll());
        model.addAttribute("donation", new Donation());
        return "form";
    }
}
