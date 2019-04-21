package com.rumofuture.summer.service.impl;

import com.rumofuture.summer.context.SummerException;
import com.rumofuture.summer.model.Ticket;
import com.rumofuture.summer.model.Train;
import com.rumofuture.summer.model.User;
import com.rumofuture.summer.repository.TicketDao;
import com.rumofuture.summer.repository.TrainDao;
import com.rumofuture.summer.service.TicketService;
import com.rumofuture.summer.util.Constant;
import com.rumofuture.summer.util.Generator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;

@Service(value = "ticketService")
public class TicketServiceImpl implements TicketService {

    @Autowired
    private TrainDao trainDao;

    @Autowired
    private TicketDao ticketDao;

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Ticket saveTicket(Integer trainId, User user) {
        Train train = trainDao.selectById(trainId);
        Ticket targetTicket = ticketDao.selectOneByTrainAndUser(train.getNumber(), user.getId());
        if (null == targetTicket) {
            Ticket ticket = new Ticket();
            ticket.setObjectId(Generator.getObjectId());
            ticket.setStatus(1);
            ticket.setCreateAt(LocalDateTime.now().withNano(0));
            ticket.setUpdateAt(LocalDateTime.now().withNano(0));
            ticket.setTrainNo(train.getNumber());
            /**
             * 假设一节车厢16排座位，一排5个座，一节车厢总共80个座
             */
            int soldTicket = train.getCarriageTotal() * 80 - train.getRemainderTicket();
            ticket.setCarriageNo(soldTicket / 80 + 1);
            ticket.setSeatNo("" + (soldTicket / 5 + 1) + (char) (soldTicket % 5 + 65));
            ticket.setFromCity(train.getFromCity());
            ticket.setToCity(train.getToCity());
            ticket.setDepartureTime(train.getDepartureTime());
            ticket.setPrice(train.getTicketPrice());
            ticket.setUser(user);
            ticketDao.save(ticket);

            train.setRemainderTicket(train.getRemainderTicket() - 1);
            train.setUpdateAt(LocalDateTime.now().withNano(0));
            trainDao.update(train);

            return ticket;
        } else {
            throw new SummerException(Constant.RespStatus.TICKET_EXIST);
        }
    }

    @Override
    @Transactional(readOnly = true, rollbackFor = Exception.class)
    public List<Ticket> findTicketListByUser(Integer userId) {
        return ticketDao.selectListByUser(userId);
    }

    @Override
    @Transactional(readOnly = true, rollbackFor = Exception.class)
    public List<Ticket> findTicketListWithUser() {
        return ticketDao.selectListContainsUser();
    }
}
