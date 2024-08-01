package pl.coderslab.charity.repositories;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import pl.coderslab.charity.models.User;

public interface UsersRepository extends CrudRepository<User, Integer> {
    @Query("SELECT u FROM User u WHERE u.email=:email")
    User findByEmail(String email);
}
