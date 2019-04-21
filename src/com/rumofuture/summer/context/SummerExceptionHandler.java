package com.rumofuture.summer.context;

import com.rumofuture.summer.model.Response;
import com.rumofuture.summer.util.Constant;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice
public class SummerExceptionHandler {

    private final Logger logger = LoggerFactory.getLogger(SummerExceptionHandler.class);

    @ExceptionHandler(value = Exception.class)
    public Response<Object> handleException(Exception e) {
        logger.error("SummerExceptionHandler", e);
        return new Response<>(Constant.RespStatus.SYSTEM_ERROR);
    }

    @ExceptionHandler(value = SummerException.class)
    public Response<Object> handleNemoException(SummerException e) {
        logger.error("SummerExceptionHandler", e);
        return new Response<>(e.getStatusCode());
    }
}
