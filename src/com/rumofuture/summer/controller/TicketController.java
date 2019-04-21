package com.rumofuture.summer.controller;

import com.rumofuture.summer.context.SummerException;
import com.rumofuture.summer.model.Response;
import com.rumofuture.summer.model.Ticket;
import com.rumofuture.summer.model.Train;
import com.rumofuture.summer.model.User;
import com.rumofuture.summer.service.TicketService;
import com.rumofuture.summer.util.Constant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

@RestController
@RequestMapping(value = "api")
public class TicketController extends SummerController {

    @Autowired
    private TicketService ticketService;

    @PostMapping(value = "tickets")
    public Response<Ticket> actionCreateTicket(@RequestBody Train train) {
        Ticket ticket = ticketService.saveTicket(train.getId(), getSessionUser());
        return new Response<>(ticket);
    }
}
