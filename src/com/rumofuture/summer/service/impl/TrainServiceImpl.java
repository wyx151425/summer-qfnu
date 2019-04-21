package com.rumofuture.summer.service.impl;

import com.rumofuture.summer.model.Page;
import com.rumofuture.summer.model.Train;
import com.rumofuture.summer.repository.TrainDao;
import com.rumofuture.summer.service.TrainService;
import com.rumofuture.summer.util.Generator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

@Service(value = "trainService")
public class TrainServiceImpl implements TrainService {

    @Autowired
    private TrainDao trainDao;

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void saveTrain(Train train) {
        train.setObjectId(Generator.getObjectId());
        train.setStatus(1);
        train.setCreateAt(LocalDateTime.now().withNano(0));
        train.setUpdateAt(LocalDateTime.now().withNano(0));
        trainDao.save(train);
    }

    @Override
    public Train findTrainById(Integer id) {
        return trainDao.selectById(id);
    }

    @Override
    public List<Train> findTrainListOfToday(Integer offset) {
        Page page = new Page(offset, 32);
        LocalDate localDate = LocalDate.now();
        LocalDateTime endTime = LocalDateTime.of(localDate.getYear(), localDate.getMonth(), localDate.getDayOfMonth(), 23, 59, 59);
        return trainDao.selectByTimeZone(LocalDateTime.now().withNano(0), endTime, page);
    }

    @Override
    public List<Train> findTrainList(Integer offset) {
        Page page = new Page(offset, 32);
        return trainDao.selectByTimeZone(LocalDateTime.now().withNano(0), null, page);
    }

    @Override
    public List<Train> findTrainListByCity(String fromCity, String toCity) {
        return trainDao.selectByCity(fromCity, toCity);
    }
}
