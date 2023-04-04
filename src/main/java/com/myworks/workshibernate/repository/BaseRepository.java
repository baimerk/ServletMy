package com.myworks.workshibernate.repository;

import java.util.List;

public interface BaseRepository <T>{
    List<T> findAll();
    List<T> findAllType();
    T findById(long id);
    boolean create (T entity);
    T update (T entity);
    boolean deleteById(long id);
    T findByLoginAndPassword(String login, String password);
}
