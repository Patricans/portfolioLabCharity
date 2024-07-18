package pl.coderslab.charity.repositories;

import org.springframework.data.repository.CrudRepository;
import pl.coderslab.charity.models.Category;

public interface CategoryRepository extends CrudRepository<Category, Integer> {
}
