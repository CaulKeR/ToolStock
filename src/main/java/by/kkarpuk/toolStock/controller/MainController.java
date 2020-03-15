package by.kkarpuk.toolStock.controller;

import by.kkarpuk.toolStock.model.Tool;
import by.kkarpuk.toolStock.service.ToolService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
public class MainController {

    private final ToolService toolService;

    @GetMapping("/hello/{id}")
    public Tool sayHello(@PathVariable Long id) {
        return toolService.getTool(id);
    }

}
