package com.rumofuture.summer.context;

public class SummerException extends RuntimeException {

    private int statusCode;

    public SummerException(int statusCode) {
        this.statusCode = statusCode;
    }

    public int getStatusCode() {
        return statusCode;
    }
}
