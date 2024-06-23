package com.example.demo.util;

import java.util.HashMap;
import java.util.Map;

public class UsersUtil {
	public static Map<String, String> userMap = new HashMap<>();

    static {
        userMap.put("nico", "jimin");
        userMap.put("user1", "password1");
        userMap.put("user2", "password2");
        userMap.put("user3", "password3");
    }
}
