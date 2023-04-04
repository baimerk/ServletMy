package com.myworks.mainapp;

import com.myworks.workshibernate.model.User;
import com.myworks.workshibernate.service.BaseService;
import com.myworks.workshibernate.service.impl.UserServiceImpl;

public class ApplicationApp {
    public static void main(String[] args) {
        //User user = new User("Maksim", "Kim", true, "Login", "Password", 33);
        //User user = new User("Maks", "K", "Log", "123te");
        User user = new User("Mak", "kIm", "Minsk", true);
        BaseService<User> service = new UserServiceImpl();
        service.create(user);
    }
}
