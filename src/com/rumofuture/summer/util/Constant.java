package com.rumofuture.summer.util;

public class Constant {
    public static final String USER = "user";
    public static final String TRAIN = "train";
    public static final String TRAIN_LIST = "trainList";
    public static final String TICKET_LIST = "ticketList";
    public static final String TICKET_MANAGE = "ticketManage";
    public static final String TICKET_BOOK = "ticketBook";

    public static final class RespStatus {
        public static final int SUCCESS = 200;
        public static final int SYSTEM_ERROR = 500;
        public static final int USER_UNREGISTER = 7001;
        public static final int USER_REGISTERED = 7002;
        public static final int USER_DISABLE = 7003;
        public static final int USER_PASSWORD_ERROR = 7004;
        public static final int USER_ID_NUMBER_EXIST = 7005;
        public static final int TRAIN_EXIST = 8001;
        public static final int TICKET_EXIST = 9001;
    }
}
