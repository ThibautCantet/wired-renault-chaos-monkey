package com.renault.monkey;


import java.util.Arrays;
import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class RecommendationController {

    @GetMapping("/api/v1/recommendations")
    public Recommendations recommendations() {
        return new Recommendations(List.of("Paris", "Bruxelles", "Rome"));
    }

}
