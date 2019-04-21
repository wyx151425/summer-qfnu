package com.rumofuture.summer.service;

import com.rumofuture.summer.model.Ticket;
import com.rumofuture.summer.model.Train;
import com.rumofuture.summer.model.User;

import java.util.List;

public interface TicketService {
    Ticket saveTicket(Integer trainId, User user);
    List<Ticket> findTicketListByUser(Integer userId);
    List<Ticket> findTicketListWithUser();
}
