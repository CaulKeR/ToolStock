package by.kkarpuk.toolStock.repositories;

import by.kkarpuk.toolStock.model.Tool;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface ToolRepository extends CrudRepository<Tool, Long> {
}
