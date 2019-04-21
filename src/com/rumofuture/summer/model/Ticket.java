package com.rumofuture.summer.model;

import java.io.Serializable;
import java.time.LocalDateTime;

public class Ticket extends Entity implements Serializable {
    private String trainNo;  // 列车号
    private Integer carriageNo;  // 车厢号
    private String seatNo;  // 座位号
    private String fromCity;  // 出发城市
    private String toCity;  // 到达城市
    private LocalDateTime departureTime;  // 发车时间
    private Double price;  // 票价

    private Integer userId;
    private User user;

    public Ticket() {
    }

    public String getTrainNo() {
        return trainNo;
    }

    public void setTrainNo(String trainNo) {
        this.trainNo = trainNo;
    }

    public Integer getCarriageNo() {
        return carriageNo;
    }

    public void setCarriageNo(Integer carriageNo) {
        this.carriageNo = carriageNo;
    }

    public String getSeatNo() {
        return seatNo;
    }

    public void setSeatNo(String seatNo) {
        this.seatNo = seatNo;
    }

    public String getFromCity() {
        return fromCity;
    }

    public void setFromCity(String fromCity) {
        this.fromCity = fromCity;
    }

    public String getToCity() {
        return toCity;
    }

    public void setToCity(String toCity) {
        this.toCity = toCity;
    }

    public LocalDateTime getDepartureTime() {
        return departureTime;
    }

    public void setDepartureTime(LocalDateTime departureTime) {
        this.departureTime = departureTime;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
