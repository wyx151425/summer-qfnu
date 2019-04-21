package com.rumofuture.summer.model;

import com.rumofuture.summer.util.Constant;

public class Response<T> {
    private int statusCode;
    private T data;

    public Response() {
        statusCode = Constant.RespStatus.SUCCESS;
    }

    public Response(T data) {
        statusCode = Constant.RespStatus.SUCCESS;
        this.data = data;
    }

    public Response(int statusCode) {
        this.statusCode = statusCode;
    }

    public int getStatusCode() {
        return statusCode;
    }

    public void setStatusCode(int statusCode) {
        this.statusCode = statusCode;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }
}
