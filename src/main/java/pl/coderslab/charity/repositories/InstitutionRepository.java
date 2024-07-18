package pl.coderslab.charity.repositories;

import org.springframework.data.repository.CrudRepository;
import pl.coderslab.charity.models.Institution;

public interface InstitutionRepository extends CrudRepository<Institution, Integer> {
}
