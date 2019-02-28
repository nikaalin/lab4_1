package ru.ifmo.se.lab4.ejb;

import ru.ifmo.se.lab4.domain.User;

import javax.annotation.sql.DataSourceDefinition;
import javax.ejb.Startup;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import java.security.MessageDigest;
import java.security.SecureRandom;

@Startup
@Stateless
public class AuthBean {
    @PersistenceContext(unitName = "lab4")
    private EntityManager entityManager;

    public boolean userExist(String userName, String password) {
        String queryStr = "Select u FROM User u WHERE u.login = :username and u.password_hash = :password and u.salt=:salt";
        TypedQuery<User> query = entityManager.
                createQuery(queryStr, User.class);
        query.setParameter("username", userName);
        query.setParameter("password", password);
        User user = query.getSingleResult();

        return user != null;
    }


}


