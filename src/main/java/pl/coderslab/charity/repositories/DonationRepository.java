package pl.coderslab.charity.repositories;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import pl.coderslab.charity.models.Donation;

public interface DonationRepository extends CrudRepository<Donation, Integer> {
    @Query("SELECT sum (d.quantity) FROM Donation d")
    Long findDonationSum();

}
