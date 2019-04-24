package com.rumofuture.summer.controller;

import com.rumofuture.summer.model.Response;
import com.rumofuture.summer.model.Ticket;
import com.rumofuture.summer.model.Train;
import com.rumofuture.summer.service.TicketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

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

    @PostMapping(value = "ticketDel/{id}")
    public Response<Ticket> actionDeleteTicket(@PathVariable(value = "id") Integer id) {
        ticketService.deleteTicket(id);
        return new Response<>();
    }
}
