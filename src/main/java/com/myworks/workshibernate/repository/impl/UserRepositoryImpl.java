package com.myworks.workshibernate.repository.impl;

import com.myworks.workshibernate.config.ConfigSessionFactory;
import com.myworks.workshibernate.model.User;
import com.myworks.workshibernate.repository.BaseRepository;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;


import javax.persistence.NoResultException;
import java.util.List;

public class UserRepositoryImpl implements BaseRepository <User> {
    @Override
    public List<User> findAll() { //этот метод позволяет найти всех пользователей и записать их в массив, язык HQL
        Session session = ConfigSessionFactory.getSessionFactory().openSession();
        return (List<User>) session.createQuery("from User ").getResultList();
    }
    @Override
    public List<User> findAllType() {
        return null;
    }
    @Override
    public User findByLoginAndPassword(String login, String password) {
        Session session = ConfigSessionFactory.getSessionFactory().openSession();
        Query<?> query = session.createQuery("from User where login=:login and password=:password");
        query.setParameter("login", login);
        query.setParameter("password", password);
        try {
            return (User) query.getSingleResult();
        } catch (NoResultException e) {
            return null;
        }
    }
    @Override
    public boolean create(User entity) {
        Transaction transaction = null;
        try (Session session = ConfigSessionFactory.getSessionFactory().openSession();){
            transaction = session.beginTransaction();
            session.save(entity);
            transaction.commit();
            return true;
        } catch (Exception exception){
            if (transaction != null) {
                transaction.rollback();
            }
        }
        return false;
    }
    @Override
    public User findById(long id) {
        Session session = ConfigSessionFactory.getSessionFactory().openSession();
        return session.get(User.class, id);
    }
    @Override
    public User update(User entity) {
        Transaction transaction = null;
        try (Session session = ConfigSessionFactory.getSessionFactory().openSession()){
            transaction = session.beginTransaction();
            session.update(entity);
            transaction.commit();
            return session.get(User.class, entity.getId());
        } catch (Exception e) {
            if (transaction != null){
                transaction.rollback();
            }
        }
        return entity;
    }

    @Override
    public boolean deleteById(long id) {
        Transaction transaction = null;
        try (Session session = ConfigSessionFactory.getSessionFactory().openSession()){
            transaction = session.beginTransaction();
            User user = session.get(User.class, id);
            if (user != null){
                session.delete(user);
                transaction.commit();
                return true;
            }
        } catch (Exception e) {
            if (transaction != null){
                transaction.rollback();
            }
        }
        return false;
    }
}

