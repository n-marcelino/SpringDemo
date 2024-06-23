package com.example.demo.service;

import com.example.demo.model.User;
import com.example.demo.model.UserSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class UserService {

    public Map<String, String> userMap = new HashMap<>();

    @Autowired
    private UserSession userSession;

    public UserService(){
        userMap.put("nico", "jimin");
        userMap.put("desmond", "miles");
        userMap.put("ezio", "auditore");
    }

    public User findByUsername(String username){
        String password = userMap.get(username);
        if(password !=null){
            return new User(username, password);
        }else{
            return null;
        }
    }

    public boolean validateUser(String username, String password){
        if(password.equals(userMap.get(username))) {
            userSession.setUsername(username);
            return true;
        }
        return false;
    }
}
