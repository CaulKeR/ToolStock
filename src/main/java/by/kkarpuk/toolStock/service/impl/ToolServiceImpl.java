package by.kkarpuk.toolStock.service.impl;

import by.kkarpuk.toolStock.model.Tool;
import by.kkarpuk.toolStock.repositories.ToolRepository;
import by.kkarpuk.toolStock.service.ToolService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class ToolServiceImpl implements ToolService {

    private final ToolRepository toolRepository;

    @Override
    public Tool getTool(Long id) {
        //noinspection OptionalGetWithoutIsPresent
        return toolRepository.findById(id).get();
    }
}
