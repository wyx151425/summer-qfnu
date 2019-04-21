package com.rumofuture.summer.model;

import java.io.Serializable;
import java.time.LocalDateTime;

public class Train extends Entity implements Serializable {
    private String number;  // 车厢编号
    private Integer carriageTotal;  // 车厢数
    private Integer remainderTicket;  // 余票
    private String fromCity;  // 出发城市
    private String toCity;  // 到达城市
    private LocalDateTime departureTime;  // 发车时间
    private Double ticketPrice;  // 票价

    public Train() {
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public Integer getCarriageTotal() {
        return carriageTotal;
    }

    public void setCarriageTotal(Integer carriageTotal) {
        this.carriageTotal = carriageTotal;
    }

    public Integer getRemainderTicket() {
        return remainderTicket;
    }

    public void setRemainderTicket(Integer remainderTicket) {
        this.remainderTicket = remainderTicket;
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

    public Double getTicketPrice() {
        return ticketPrice;
    }

    public void setTicketPrice(Double ticketPrice) {
        this.ticketPrice = ticketPrice;
    }

    @Override
    public String toString() {
        return "Train{" +
                "number='" + number + '\'' +
                ", carriageTotal=" + carriageTotal +
                ", remainderTicket=" + remainderTicket +
                ", fromCity='" + fromCity + '\'' +
                ", toCity='" + toCity + '\'' +
                ", departureTime=" + departureTime +
                ", ticketPrice=" + ticketPrice +
                '}';
    }
}
