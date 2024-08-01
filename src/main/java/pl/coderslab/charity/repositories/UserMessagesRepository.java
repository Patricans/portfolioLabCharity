package pl.coderslab.charity.repositories;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import pl.coderslab.charity.models.Donation;
import pl.coderslab.charity.models.UserMessage;

public interface UserMessagesRepository extends CrudRepository<UserMessage, Integer> {


}
