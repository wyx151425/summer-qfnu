package com.rumofuture.summer.util;

import java.util.UUID;

public class Generator {
    public static String getObjectId() {
        return UUID.randomUUID().toString()
                .replace("-", "").toUpperCase();
    }
}
