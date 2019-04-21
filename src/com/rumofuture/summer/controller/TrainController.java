package com.rumofuture.summer.controller;

import com.rumofuture.summer.context.SummerException;
import com.rumofuture.summer.model.Response;
import com.rumofuture.summer.model.Train;
import com.rumofuture.summer.service.TrainService;
import com.rumofuture.summer.util.Constant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.security.auth.login.FailedLoginException;

@RestController
@RequestMapping(value = "api")
public class TrainController extends SummerController {

    @Autowired
    private TrainService trainService;

    @PostMapping(value = "trains")
    public Response<Train> actionSaveTrain(@RequestBody Train train) {
        System.out.println(train);
        trainService.saveTrain(train);
        return new Response<>(train);
    }
}
