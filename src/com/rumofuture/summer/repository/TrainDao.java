package com.rumofuture.summer.repository;

import com.rumofuture.summer.model.Page;
import com.rumofuture.summer.model.Train;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;

@Repository(value = "trainDao")
public interface TrainDao {
    void save(Train train);
    void update(Train train);
    Train selectById(Integer id);
    List<Train> selectByTimeZone(@Param("startTime") LocalDateTime startTime,
        @Param("endTime") LocalDateTime endTime, @Param("page") Page page);
    List<Train> selectByCity(@Param("fromCity") String fromCity, @Param("toCity") String toCity);
}
