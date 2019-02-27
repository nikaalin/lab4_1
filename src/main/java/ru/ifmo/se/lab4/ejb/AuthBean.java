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
//    public boolean authorization(String login, String password) {
//        byte[] salt = generateSalt();
//        byte[] hashedPassword = generateHash(password,salt);
//        return userExist(login,hashedPassword,salt);
//    }
//
//    byte[] generateHash(String passwordToHash, byte[] salt) {
//        try {
//            MessageDigest md = MessageDigest.getInstance("SHA-512");
//            md.update(salt);
//            byte[] hashedPassword = md.digest(passwordToHash.getBytes());
//            return hashedPassword;
//        }catch (Exception e){
//            e.printStackTrace();
//        }
//        return null;
//    }
//    byte[] generateSalt(){
//        SecureRandom random = new SecureRandom();
//        byte[] salt = new byte[16];
//        random.nextBytes(salt);
//        return salt;
//    }
}


