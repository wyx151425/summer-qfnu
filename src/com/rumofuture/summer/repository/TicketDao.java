package com.rumofuture.summer.repository;

import com.rumofuture.summer.model.Ticket;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository(value = "ticketDao")
public interface TicketDao {
    void save(Ticket ticket);
    List<Ticket> selectListContainsUser();
    List<Ticket> selectListByUser(Integer userId);
    Ticket selectOneByTrainAndUser(
            @Param("trainNo") String trainNo,
            @Param("userId") Integer userId
    );
    Ticket selectOneById(Integer id);
    void delete(Integer id);
}
