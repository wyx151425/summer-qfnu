package com.rumofuture.summer.service;

import com.rumofuture.summer.model.Train;

import java.util.List;

public interface TrainService {
    void saveTrain(Train train);
    Train findTrainById(Integer id);
    List<Train> findTrainList(Integer offset);
    List<Train> findTrainListByCity(String fromCity, String toCity);
    List<Train> findTrainListOfToday(Integer offset);
}
