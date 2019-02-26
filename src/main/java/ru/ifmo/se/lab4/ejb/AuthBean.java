package ru.ifmo.se.lab4.ejb;

import ru.ifmo.se.lab4.domain.User;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.QueryParam;
import java.security.MessageDigest;
import java.security.SecureRandom;

@Stateless
public class AuthBean {
    private final String login = "1";
    private final String password = "1";

    @PersistenceContext
    private EntityManager entityManager;


    public boolean userExist(String userName, byte[] password, byte[] salt) {
        String queryStr = "Select u FROM User u WHERE u.login = :username and u.password_hash = :password and u.salt=:salt";
        TypedQuery<User> query = entityManager.
                createQuery(queryStr, User.class);
        query.setParameter("username", userName);
        query.setParameter("password", password);
        query.setParameter("salt", salt);
        User user = query.getSingleResult();

        return user != null;
    }
//    public boolean authorization(String login, String password) {
//        byte[] salt = generateSalt();
//        byte[] hashedPassword = generateHash(password,salt);
//        return userExist(login,hashedPassword,salt);
//    }

    byte[] generateHash(String passwordToHash, byte[] salt) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-512");
            md.update(salt);
            byte[] hashedPassword = md.digest(passwordToHash.getBytes());
            return hashedPassword;
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }
    byte[] generateSalt(){
        SecureRandom random = new SecureRandom();
        byte[] salt = new byte[16];
        random.nextBytes(salt);
        return salt;
    }
}


